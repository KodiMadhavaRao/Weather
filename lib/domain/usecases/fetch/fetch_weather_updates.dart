part of 'fetch_weather_usecases.dart';

@Riverpod(keepAlive: true)
FetchWeatherUpdatesUseCase fetchWeatherUpdatesUseCase(
    FetchWeatherUpdatesUseCaseRef ref) {
  return FetchWeatherUpdatesUseCase(ref.watch(weatherRepositoryProvider));
}

class FetchWeatherUpdatesUseCase
    extends UseCase<DataState<Weather>, WeatherUseCaseParams> {
  final WeatherRepository _weatherRepository;

  FetchWeatherUpdatesUseCase(this._weatherRepository);

  @override
  Future<DataState<Weather>> call(WeatherUseCaseParams params) async {
    return _weatherRepository.fetchWeatherUpdates(
        params.longitude, params.longitude);
  }
}
