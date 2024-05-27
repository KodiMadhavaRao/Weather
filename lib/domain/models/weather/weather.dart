import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/mappers/ui_model.dart';
import '../../../data/models/cache/weather/weather_cache_dto.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather implements UICacheModel<WeatherCacheDto> {
  const factory Weather({
    final Location? location,
    final Current? current,
    final Forecast? forecast,
  }) = _Weather;
  const Weather._();

  @override
  WeatherCacheDto toCacheDto() => WeatherCacheDto(
        location: location?.toCacheDto(),
        current: current?.toCacheDto(),
        forecast: forecast?.toCacheDto(),
      );
}

@freezed
class Location with _$Location implements UICacheModel<LocationCacheDto> {
  const factory Location({
    final String? name,
    final String? region,
    final String? country,
    final double? lat,
    final double? lon,
    final String? tzId,
    final int? localtimeEpoch,
    final String? localtime,
  }) = _Location;
  const Location._();

  @override
  LocationCacheDto toCacheDto() => LocationCacheDto(
        name: name,
        region: region,
        country: country,
        lat: lat,
        lon: lon,
        tzId: tzId,
        localtimeEpoch: localtimeEpoch,
        localtime: localtime,
      );
}

@freezed
class Current with _$Current implements UICacheModel<CurrentCacheDto> {
  const factory Current({
    final int? lastUpdatedEpoch,
    final String? lastUpdated,
    final double? tempC,
    final double? tempF,
    final int? isDay,
    final Condition? condition,
    final double? windMph,
    final double? windKph,
    final int? windDegree,
    final String? windDir,
    final double? pressureMb,
    final double? pressureIn,
    final double? precipMm,
    final double? precipIn,
    final int? humidity,
    final int? cloud,
    final double? feelslikeC,
    final double? feelslikeF,
    final double? visKm,
    final double? visMiles,
    final double? uv,
    final double? gustMph,
    final double? gustKph,
  }) = _Current;
  const Current._();

  @override
  CurrentCacheDto toCacheDto() => CurrentCacheDto(
        lastUpdatedEpoch: lastUpdatedEpoch,
        lastUpdated: lastUpdated,
        tempC: tempC,
        tempF: tempF,
        isDay: isDay,
        condition: condition?.toCacheDto(),
        windMph: windMph,
        windKph: windKph,
        windDegree: windDegree,
        windDir: windDir,
        pressureMb: pressureMb,
        pressureIn: pressureIn,
        precipMm: precipMm,
        precipIn: precipIn,
        humidity: humidity,
        cloud: cloud,
        feelslikeC: feelslikeC,
        feelslikeF: feelslikeF,
        visKm: visKm,
        visMiles: visMiles,
        uv: uv,
        gustMph: gustMph,
        gustKph: gustKph,
      );
}

@freezed
class Condition with _$Condition implements UICacheModel<ConditionCacheDto> {
  const factory Condition({
    final String? text,
    final String? icon,
    final int? code,
  }) = _Condition;
  const Condition._();

  @override
  ConditionCacheDto toCacheDto() => ConditionCacheDto(
        text: text,
        icon: icon,
        code: code,
      );
}

@freezed
class Forecast with _$Forecast implements UICacheModel<ForecastCacheDto> {
  const factory Forecast({
    final List<Forecastday>? forecastday,
  }) = _Forecast;
  const Forecast._();

  @override
  ForecastCacheDto toCacheDto() => ForecastCacheDto(
        forecastday: forecastday?.map((e) => e.toCacheDto()).toList(),
      );
}

@freezed
class Forecastday
    with _$Forecastday
    implements UICacheModel<ForecastdayCacheDto> {
  const factory Forecastday({
    final String? date,
    final int? dateEpoch,
    final Day? day,
    final Astro? astro,
    final List<Hour>? hour,
  }) = _Forecastday;
  const Forecastday._();

  @override
  ForecastdayCacheDto toCacheDto() => ForecastdayCacheDto(
        date: date,
        dateEpoch: dateEpoch,
        day: day?.toCacheDto(),
        astro: astro?.toCacheDto(),
        hour: hour?.map((e) => e.toCacheDto()).toList(),
      );
}

@freezed
class Day with _$Day implements UICacheModel<DayCacheDto> {
  const factory Day({
    final double? maxtempC,
    final double? maxtempF,
    final int? mintempC,
    final double? mintempF,
    final double? avgtempC,
    final double? avgtempF,
    final double? maxwindMph,
    final double? maxwindKph,
    final double? totalprecipMm,
    final double? totalprecipIn,
    final int? totalsnowCm,
    final int? avgvisKm,
    final int? avgvisMiles,
    final int? avghumidity,
    final int? dailyWillItRain,
    final int? dailyChanceOfRain,
    final int? dailyWillItSnow,
    final int? dailyChanceOfSnow,
    final Condition? condition,
    final int? uv,
  }) = _Day;
  const Day._();

  @override
  DayCacheDto toCacheDto() => DayCacheDto(
        maxtempC: maxtempC,
        maxtempF: maxtempF,
        mintempC: mintempC,
        mintempF: mintempF,
        avgtempC: avgtempC,
        avgtempF: avgtempF,
        maxwindMph: maxwindMph,
        maxwindKph: maxwindKph,
        totalprecipMm: totalprecipMm,
        totalprecipIn: totalprecipIn,
        totalsnowCm: totalsnowCm,
        avgvisKm: avgvisKm,
        avgvisMiles: avgvisMiles,
        avghumidity: avghumidity,
        dailyWillItRain: dailyWillItRain,
        dailyChanceOfRain: dailyChanceOfRain,
        dailyWillItSnow: dailyWillItSnow,
        dailyChanceOfSnow: dailyChanceOfSnow,
        condition: condition?.toCacheDto(),
        uv: uv,
      );
}

@freezed
class Astro with _$Astro implements UICacheModel<AstroCacheDto> {
  const factory Astro({
    final String? sunrise,
    final String? sunset,
    final String? moonrise,
    final String? moonset,
    final String? moonPhase,
    final int? moonIllumination,
    final int? isMoonUp,
    final int? isSunUp,
  }) = _Astro;
  const Astro._();

  @override
  AstroCacheDto toCacheDto() => AstroCacheDto(
        sunrise: sunrise,
        sunset: sunset,
        moonrise: moonrise,
        moonset: moonset,
        moonPhase: moonPhase,
        moonIllumination: moonIllumination,
        isMoonUp: isMoonUp,
        isSunUp: isSunUp,
      );
}

@freezed
class Hour with _$Hour implements UICacheModel<HourCacheDto> {
  const factory Hour({
    final int? timeEpoch,
    final String? time,
    final double? tempC,
    final double? tempF,
    final int? isDay,
    final Condition? condition,
    final double? windMph,
    final double? windKph,
    final int? windDegree,
    final String? windDir,
    final int? pressureMb,
    final double? pressureIn,
    final double? precipMm,
    final double? precipIn,
    final int? snowCm,
    final int? humidity,
    final int? cloud,
    final double? feelslikeC,
    final double? feelslikeF,
    final double? windchillC,
    final double? windchillF,
    final double? heatindexC,
    final double? heatindexF,
    final double? dewpointC,
    final double? dewpointF,
    final int? willItRain,
    final int? chanceOfRain,
    final int? willItSnow,
    final int? chanceOfSnow,
    final int? visKm,
    final int? visMiles,
    final double? gustMph,
    final double? gustKph,
    final int? uv,
  }) = _Hour;
  const Hour._();

  @override
  HourCacheDto toCacheDto() => HourCacheDto(
        timeEpoch: timeEpoch,
        time: time,
        tempC: tempC,
        tempF: tempF,
        isDay: isDay,
        condition: condition?.toCacheDto(),
        windMph: windMph,
        windKph: windKph,
        windDegree: windDegree,
        windDir: windDir,
        pressureMb: pressureMb,
        pressureIn: pressureIn,
        precipMm: precipMm,
        precipIn: precipIn,
        snowCm: snowCm,
        humidity: humidity,
        cloud: cloud,
        feelslikeC: feelslikeC,
        feelslikeF: feelslikeF,
        windchillC: windchillC,
        windchillF: windchillF,
        heatindexC: heatindexC,
        heatindexF: heatindexF,
        dewpointC: dewpointC,
        dewpointF: dewpointF,
        willItRain: willItRain,
        chanceOfRain: chanceOfRain,
        willItSnow: willItSnow,
        chanceOfSnow: chanceOfSnow,
        visKm: visKm,
        visMiles: visMiles,
        gustMph: gustMph,
        gustKph: gustKph,
        uv: uv,
      );
}
