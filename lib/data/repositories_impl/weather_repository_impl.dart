import 'package:dio/dio.dart';

import '../../core/utils/api/response/api_response.dart';
import '../../domain/models/weather/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../data_source/local/weather_local_data_source.dart';
import '../data_source/remote/weather_remote_data_source.dart';
import '../models/api/weather/weather_api_dto.dart';
import '../models/result/data_state.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _weatherRemoteDataSource;
  final WeatherLocalDataSource _weatherLocalDataSource;
  WeatherRepositoryImpl(
      this._weatherRemoteDataSource, this._weatherLocalDataSource);
  @override
  Future<DataState<Weather>> weatherUpdates(
    CancelToken? cancelToken,
    double? latitude,
    double? longitude,
  ) async {
    final weatherResponse = await _weatherRemoteDataSource.weatherUpdates(
        cancelToken, latitude, longitude);
    switch (weatherResponse) {
      case ApiResponseSuccess<WeatherApiDto>(data: WeatherApiDto res):
        return _weatherLocalDataSource.storeWeather(res.toCacheDto());
      case ApiResponseError<WeatherApiDto>(ex: var ex):
        return DataStateError(ex);
    }
  }

  @override
  Future<DataState<Weather>> fetchWeatherUpdates(
      double? latitude, double? longitude) async {
    return await _weatherLocalDataSource.getWeather();
  }
}
