import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../core/utils/errors/app_exception.dart';
import '../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../domain/states/weather_state.dart';
import '../../../../../providers/weather/weather_provider.dart';
import '../../../../modals/alert_dialogs/app_setting_popup.dart';
import '../../../../modals/snack_bar/snack_bar_factory.dart';
import '../../../../widgets/custom_network_image.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/error_cards/no_internet_card.dart';
import '../../../../widgets/error_cards/something_went_wrong_card.dart';
import '../../../../widgets/shimmer/common_shimmer.dart';
import 'widgets/weather_card.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchWeatherData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherUpdatesState = ref.watch(weatherUpdatesNotifierProvider);
    return Padding(
      padding: UIDimensions.symmetricPaddingGeometry(horizontal: 16),
      child: switch (weatherUpdatesState) {
        WeatherStateInitial() => ListView.separated(
            itemBuilder: (context, index) => index == 0
                ? const CommonShimmer(
                    height: 200,
                    width: double.infinity,
                  )
                : const CommonShimmer(
                    height: 86,
                    width: double.infinity,
                  ),
            separatorBuilder: (context, index) =>
                UIDimensions.verticalSpaceSmall,
            itemCount: 6,
          ),
        WeatherStateLoading() => ListView.separated(
            itemBuilder: (context, index) => index == 0
                ? const CommonShimmer(
                    height: 200,
                    width: double.infinity,
                  )
                : const CommonShimmer(
                    height: 86,
                    width: double.infinity,
                  ),
            separatorBuilder: (context, index) =>
                UIDimensions.verticalSpaceSmall,
            itemCount: 6,
          ),
        WeatherStateLoaded(weather: var weather) => RefreshIndicator(
            onRefresh: () async {
              fetchWeatherData();
            },
            child: CustomScrollView(
              shrinkWrap: false,
              slivers: [
                SliverAppBar(
                  toolbarHeight: 200,
                  pinned: true,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText.titleLarge(weather.location?.name ?? ''),
                      CustomText.titleLarge(
                          "${weather.location!.region!},${weather.location!.country!}"),
                      UIDimensions.verticalSpaceMedium,
                      CustomText.titleLarge(
                          "${weather.current!.tempC.toString()}°C"),
                      UIDimensions.verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: CustomNetworkImage(
                                  imageUrl:
                                      "http:${weather.current?.condition?.icon}" ??
                                          "",
                                ),
                              ),
                              CustomText.titleSmall(
                                weather.current?.condition?.text ?? "",
                                maxLines: 1,
                              )
                            ],
                          ),
                          CustomText.titleSmall(
                            removeTimeFromDateString(
                                weather.location?.localtime ?? ''),
                            maxLines: 1,
                          )
                        ],
                      )
                    ],
                  ),
                  centerTitle: false,
                ),
                SliverList.separated(
                  itemBuilder: (context, index) => WeatherCard(
                    hour: weather.forecast!.forecastday![0].hour![index],
                  ),
                  separatorBuilder: (context, index) =>
                      UIDimensions.verticalSpaceSmall,
                  itemCount:
                      weather.forecast!.forecastday![0].hour!.length ?? 0,
                )
              ],
            ),
          ),
        WeatherStateError(ex: var ex) => Container(
            child: switch (ex) {
              AppExceptionNetworkError() => NoConnectionCard(onPressed: () {
                  SnackbarFactory.noInternetCheck(ref, () async {
                    fetchWeatherData();
                  });
                }),
              _ => SomethingWentWrongCard(
                  onPressed: () {
                    SnackbarFactory.noInternetCheck(ref, () async {
                      fetchWeatherData();
                    });
                  },
                )
            },
          ),
      },
    );
  }

  String removeTimeFromDateString(String dateTimeString) {
    // Split the string at the space separating date and time
    List<String> parts = dateTimeString.split(' ');
    if (parts.length != 2) {
      // Throw an exception if the format is invalid
      throw FormatException(
          "Invalid datetime string format. Expected YYYY-MM-DD HH:MM:SS");
    }
    return parts[0]; // Return the first part (date)
  }

  Future<Position> _determinePosition() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled return an error message
      return Future.error('Location services are disabled.');
    }

    // Check location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // If permissions are granted, return the current location
    return await Geolocator.getCurrentPosition();
  }

  void fetchWeatherData() async {
    requestPermission();
    bool isEnabled = await checkPermissionStatus();
    if (isEnabled) {
      try {
        Position position = await _determinePosition();
        ref
            .read(weatherUpdatesNotifierProvider.notifier)
            .getWeatherUpdates(position.latitude, position.longitude);
      } catch (e) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return const ShowAppSettingMessage(); // Show the MyPopup widget as the content of the dialog
          },
        );
        SnackbarFactory.showError("Something went wrong");
      }
    }
  }

  Future<bool> checkPermissionStatus() async {
    const permission = Permission.location;
    return await permission.status.isGranted;
  }

  Future<void> requestPermission() async {
    const permission = Permission.location;

    if (await permission.isDenied) {
      await permission.request();
    }
  }
}
