import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/extensions/ref_extensions.dart';
import '../../../data/data_service_providers.dart';
import '../../../data/models/result/data_state.dart';
import '../../../domain/models/weather/weather.dart';
import '../../../domain/states/weather_state.dart';
import '../../../domain/usecases/fetch/fetch_weather_usecases.dart';
import '../../../domain/usecases/weather/weather_usecases.dart';

part 'weather_provider.g.dart';

@riverpod
class WeatherUpdatesNotifier extends _$WeatherUpdatesNotifier {
  late final _cancelToken = ref.cancelToken();

  late final WeatherUpdates _weatherUpdates =
      ref.watch(weatherUpdatesUseCaseProvider);

  late final FetchWeatherUpdatesUseCase _fetchWeatherUpdates =
      ref.watch(fetchWeatherUpdatesUseCaseProvider);

  @override
  WeatherState build() {
    return const WeatherStateInitial();
  }

  Future<void> getWeatherUpdates(double latitude, double longitude) async {
    state = const WeatherStateLoading();
    //? Below await was for testing but can be used as debounced also
    //? await Future.delayed(const Duration(seconds: 5));
    if (!_cancelToken.isCancelled) {
      final params = WeatherUseCaseParams(
          cancelToken: _cancelToken, latitude: latitude, longitude: longitude);
      bool? isConnected = ref.read(connectivityServiceProvider).isConnected;
      DataState<Weather> dataState;
      if (isConnected ?? true) {
        dataState = await _weatherUpdates(
          params,
        );
      } else {
        dataState = await _fetchWeatherUpdates(params);
      }

      if (!_cancelToken.isCancelled) {
        switch (dataState) {
          case DataStateSuccess<Weather>(data: var weather):
            state = WeatherStateLoaded(weather: weather);
          case DataStateError<Weather>(ex: var ex):
            state = WeatherStateError(ex);
        }
      }
    }
  }
}
