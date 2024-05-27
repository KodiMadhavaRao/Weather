import 'package:dio/dio.dart';

import '../../core/utils/api/response/api_response.dart';
import '../../domain/models/weather/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../data_source/remote/weather_remote_data_source.dart';
import '../models/api/weather/weather_api_dto.dart';
import '../models/result/data_state.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _weatherRemoteDataSource;
  WeatherRepositoryImpl(this._weatherRemoteDataSource);
  @override
  Future<DataState<Weather>> weatherUpdates(
    CancelToken? cancelToken,
    double? latitude,
    double? longitude,
  ) async {
    final topHeadlineResponse = await _weatherRemoteDataSource.weatherUpdates(
        cancelToken, latitude, longitude);
    switch (topHeadlineResponse) {
      case ApiResponseSuccess<WeatherApiDto>(data: WeatherApiDto res):
        return DataStateSuccess(res.toCacheDto().toModel());
      case ApiResponseError<WeatherApiDto>(ex: var ex):
        return DataStateError(ex);
    }
  }
}
