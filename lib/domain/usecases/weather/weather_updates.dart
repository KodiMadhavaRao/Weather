part of 'weather_usecases.dart';

@Riverpod(keepAlive: true)
WeatherUpdates weatherUpdatesUseCase(WeatherUpdatesUseCaseRef ref) {
  return WeatherUpdates(ref.watch(weatherRepositoryProvider));
}

class WeatherUpdates extends UseCase<DataState<Weather>, WeatherUseCaseParams> {
  final WeatherRepository _weatherRepository;
  WeatherUpdates(this._weatherRepository);

  @override
  Future<DataState<Weather>> call(WeatherUseCaseParams param) async {
    return await _weatherRepository.weatherUpdates(
      param.cancelToken,
      param.latitude,
      param.longitude,
    );
  }
}

class WeatherUseCaseParams {
  final CancelToken? cancelToken;
  final double? latitude;
  final double? longitude;
  WeatherUseCaseParams({
    this.cancelToken,
    this.latitude,
    this.longitude,
  });
}
