import '../../data/models/api/user/user_api_dto.dart';
import '../../data/models/api/weather/weather_api_dto.dart';
import '../utils/errors/app_exception.dart';

abstract class AppSerializer {
  static T fromJson<T>(Map<String, dynamic> json) {
    return switch (T) {
      const (UserApiDto) => UserApiDto.fromJson(json) as T,
      const (WeatherApiDto) => WeatherApiDto.fromJson(json) as T,

      //?Add API DTO hers
      _ => throw const AppExceptionSerializationError(),
    };
  }
}
