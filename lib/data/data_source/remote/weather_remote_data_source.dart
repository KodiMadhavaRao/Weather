import 'package:dio/dio.dart';

import '../../../core/utils/api/api_manager/api_manager.dart';
import '../../../core/utils/api/request_type.dart';
import '../../../core/utils/api/response/api_response.dart';
import '../../enums/endpoints.dart';
import '../../models/api/weather/weather_api_dto.dart';

class WeatherRemoteDataSource {
  final ApiManager _apiManager;
  WeatherRemoteDataSource(this._apiManager);

  Future<ApiResponse<WeatherApiDto>> weatherUpdates(
    CancelToken? cancelToken,
    double? latitude,
    double? longitude,
  ) async {
    final param = {
      "q": "$latitude,$longitude",
    };
    return _apiManager.requestAsync<WeatherApiDto>(
      requestType: RequestType.get,
      endpoint: EndPoints.weather.val(),
      queryParams: param,
      cancelToken: cancelToken,
    );
  }
}
