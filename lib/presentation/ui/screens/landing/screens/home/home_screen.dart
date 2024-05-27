import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/errors/app_exception.dart';
import '../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../domain/states/weather_state.dart';
import '../../../../../providers/weather/weather_provider.dart';
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
      ref
          .read(weatherUpdatesNotifierProvider.notifier)
          .getWeatherUpdates(17.4435, 78.3772);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherUpdatesState = ref.watch(weatherUpdatesNotifierProvider);
    return Padding(
      padding: UIDimensions.symmetricPaddingGeometry(horizontal: 16),
      child: switch (weatherUpdatesState) {
        WeatherStateInitial() => const SizedBox.shrink(),
        WeatherStateLoading() => ListView.separated(
            itemBuilder: (context, index) => const CommonShimmer(
              height: 86,
              width: double.infinity,
            ),
            separatorBuilder: (context, index) =>
                UIDimensions.verticalSpaceSmall,
            itemCount: 6,
          ),
        WeatherStateLoaded(weather: var weather) => RefreshIndicator(
            onRefresh: () async {
              ref
                  .read(weatherUpdatesNotifierProvider.notifier)
                  .getWeatherUpdates(17.4435, 78.3772);
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
                    await ref
                        .read(weatherUpdatesNotifierProvider.notifier)
                        .getWeatherUpdates(19.3, 23.6);
                  });
                }),
              _ => SomethingWentWrongCard(
                  onPressed: () {
                    SnackbarFactory.noInternetCheck(ref, () async {
                      await ref
                          .read(weatherUpdatesNotifierProvider.notifier)
                          .getWeatherUpdates(19.3, 23.6);
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
}
