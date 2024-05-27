import 'package:flutter/foundation.dart';

import '../../core/utils/errors/app_exception.dart';
import '../models/weather/weather.dart';

@immutable
sealed class WeatherState {
  const WeatherState();
}

final class WeatherStateInitial extends WeatherState {
  const WeatherStateInitial();
}

final class WeatherStateLoading extends WeatherState {
  const WeatherStateLoading();
}

final class WeatherStateLoaded extends WeatherState {
  const WeatherStateLoaded({required this.weather});
  final Weather weather;

  @override
  String toString() => 'WeatherStateLoaded(weather: $weather)';
}

final class WeatherStateError extends WeatherState {
  const WeatherStateError(this.ex);
  final AppException ex;

  @override
  String toString() => 'WeatherStateError(ex: $ex)';
}

extension WeatherStateExtension on WeatherState {}
