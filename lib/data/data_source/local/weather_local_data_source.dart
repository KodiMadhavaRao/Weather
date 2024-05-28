import '../../../core/utils/errors/app_exception.dart';
import '../../../core/utils/errors/cache_exception.dart';
import '../../../core/utils/local_storage/cache/cache_manager.dart';
import '../../../domain/models/weather/weather.dart';
import '../../models/cache/weather/weather_cache_dto.dart';
import '../../models/result/data_state.dart';

class WeatherLocalDataSource {
  final CacheManager _cacheManager;

  const WeatherLocalDataSource(
    this._cacheManager,
  );

  Future<DataState<Weather>> storeWeather(
      WeatherCacheDto weatherCachedDto) async {
    final weatherCacheDtoResponse =
        await _cacheManager.insertData<WeatherCacheDto>(
      WeatherCacheDto.boxKey,
      weatherCachedDto,
    );
    if (weatherCacheDtoResponse) {
      return DataStateSuccess(weatherCachedDto.toModel());
    } else {
      return const DataStateError(
        AppExceptionCacheError(CacheExceptionInsertError()),
      );
    }
  }

  Future<DataState<Weather>> getWeather() async {
    final weatherCacheDto =
        await _cacheManager.getAll<WeatherCacheDto>(WeatherCacheDto.boxKey);
    return weatherCacheDto == null || weatherCacheDto.isEmpty
        ? const DataStateError(
            AppExceptionCacheError(CacheExceptionFetchError()),
          )
        : DataStateSuccess(
            weatherCacheDto.first.toModel(),
          );
  }

  Future<void> removeWeather() async {
    await _cacheManager.clearAll<WeatherCacheDto>(WeatherCacheDto.boxKey);
  }
}
