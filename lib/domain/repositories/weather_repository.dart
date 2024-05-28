import 'package:dio/dio.dart';

import '../../data/models/result/data_state.dart';
import '../models/weather/weather.dart';

abstract interface class WeatherRepository {
  Future<DataState<Weather>> weatherUpdates(
    CancelToken? cancelToken,
    double? latitude,
    double? longitude,
  );
  Future<DataState<Weather>> fetchWeatherUpdates(
    double? latitude,
    double? longitude,
  );
}
