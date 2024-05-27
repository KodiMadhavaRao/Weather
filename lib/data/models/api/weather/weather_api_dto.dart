import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/mappers/api_dto.dart';
import '../../cache/weather/weather_cache_dto.dart';

part 'weather_api_dto.freezed.dart';
part 'weather_api_dto.g.dart';

@freezed
class WeatherApiDto
    with _$WeatherApiDto
    implements ApiCacheDto<WeatherCacheDto> {
  const factory WeatherApiDto({
    @JsonKey(name: "location") final LocationApiDto? location,
    @JsonKey(name: "current") final CurrentApiDto? current,
    @JsonKey(name: "forecast") final ForecastApiDto? forecast,
  }) = _WeatherApiDto;
  const WeatherApiDto._();

  factory WeatherApiDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiDtoFromJson(json);
  @override
  WeatherCacheDto toCacheDto() => WeatherCacheDto(
        location: location?.toCacheDto(),
        current: current?.toCacheDto(),
        forecast: forecast?.toCacheDto(),
      );
}

@freezed
class LocationApiDto
    with _$LocationApiDto
    implements ApiCacheDto<LocationCacheDto> {
  const factory LocationApiDto({
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "region") final String? region,
    @JsonKey(name: "country") final String? country,
    @JsonKey(name: "lat") final double? lat,
    @JsonKey(name: "lon") final double? lon,
    @JsonKey(name: "tz_id") final String? tzId,
    @JsonKey(name: "localtime_epoch") final int? localtimeEpoch,
    @JsonKey(name: "localtime") final String? localtime,
  }) = _LocationApiDto;
  const LocationApiDto._();

  factory LocationApiDto.fromJson(Map<String, dynamic> json) =>
      _$LocationApiDtoFromJson(json);
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
class CurrentApiDto
    with _$CurrentApiDto
    implements ApiCacheDto<CurrentCacheDto> {
  const factory CurrentApiDto({
    @JsonKey(name: "last_updated_epoch") final int? lastUpdatedEpoch,
    @JsonKey(name: "last_updated") final String? lastUpdated,
    @JsonKey(name: "temp_c") final double? tempC,
    @JsonKey(name: "temp_f") final double? tempF,
    @JsonKey(name: "is_day") final int? isDay,
    @JsonKey(name: "condition") final ConditionApiDto? condition,
    @JsonKey(name: "wind_mph") final double? windMph,
    @JsonKey(name: "wind_kph") final double? windKph,
    @JsonKey(name: "wind_degree") final int? windDegree,
    @JsonKey(name: "wind_dir") final String? windDir,
    @JsonKey(name: "pressure_mb") final double? pressureMb,
    @JsonKey(name: "pressure_in") final double? pressureIn,
    @JsonKey(name: "precip_mm") final double? precipMm,
    @JsonKey(name: "precip_in") final double? precipIn,
    @JsonKey(name: "humidity") final int? humidity,
    @JsonKey(name: "cloud") final int? cloud,
    @JsonKey(name: "feelslike_c") final double? feelslikeC,
    @JsonKey(name: "feelslike_f") final double? feelslikeF,
    @JsonKey(name: "vis_km") final double? visKm,
    @JsonKey(name: "vis_miles") final double? visMiles,
    @JsonKey(name: "uv") final double? uv,
    @JsonKey(name: "gust_mph") final double? gustMph,
    @JsonKey(name: "gust_kph") final double? gustKph,
  }) = _CurrentApiDto;
  const CurrentApiDto._();

  factory CurrentApiDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentApiDtoFromJson(json);
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
class ConditionApiDto
    with _$ConditionApiDto
    implements ApiCacheDto<ConditionCacheDto> {
  const factory ConditionApiDto({
    @JsonKey(name: "text") final String? text,
    @JsonKey(name: "icon") final String? icon,
    @JsonKey(name: "code") final int? code,
  }) = _ConditionApiDto;
  const ConditionApiDto._();

  factory ConditionApiDto.fromJson(Map<String, dynamic> json) =>
      _$ConditionApiDtoFromJson(json);
  @override
  ConditionCacheDto toCacheDto() => ConditionCacheDto(
        text: text,
        icon: icon,
        code: code,
      );
}

@freezed
class ForecastApiDto
    with _$ForecastApiDto
    implements ApiCacheDto<ForecastCacheDto> {
  const factory ForecastApiDto({
    @JsonKey(name: "forecastday") final List<ForecastdayApiDto>? forecastday,
  }) = _ForecastApiDto;
  const ForecastApiDto._();

  factory ForecastApiDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastApiDtoFromJson(json);
  @override
  ForecastCacheDto toCacheDto() => ForecastCacheDto(
        forecastday: forecastday?.map((e) => e.toCacheDto()).toList(),
      );
}

@freezed
class ForecastdayApiDto
    with _$ForecastdayApiDto
    implements ApiCacheDto<ForecastdayCacheDto> {
  const factory ForecastdayApiDto({
    @JsonKey(name: "date") final String? date,
    @JsonKey(name: "date_epoch") final int? dateEpoch,
    @JsonKey(name: "day") final DayApiDto? day,
    @JsonKey(name: "astro") final AstroApiDto? astro,
    @JsonKey(name: "hour") final List<HourApiDto>? hour,
  }) = _ForecastdayApiDto;
  const ForecastdayApiDto._();

  factory ForecastdayApiDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayApiDtoFromJson(json);
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
class DayApiDto with _$DayApiDto implements ApiCacheDto<DayCacheDto> {
  const factory DayApiDto({
    @JsonKey(name: "maxtemp_c") final double? maxtempC,
    @JsonKey(name: "maxtemp_f") final double? maxtempF,
    @JsonKey(name: "mintemp_c") final int? mintempC,
    @JsonKey(name: "mintemp_f") final double? mintempF,
    @JsonKey(name: "avgtemp_c") final double? avgtempC,
    @JsonKey(name: "avgtemp_f") final double? avgtempF,
    @JsonKey(name: "maxwind_mph") final double? maxwindMph,
    @JsonKey(name: "maxwind_kph") final double? maxwindKph,
    @JsonKey(name: "totalprecip_mm") final double? totalprecipMm,
    @JsonKey(name: "totalprecip_in") final double? totalprecipIn,
    @JsonKey(name: "totalsnow_cm") final int? totalsnowCm,
    @JsonKey(name: "avgvis_km") final int? avgvisKm,
    @JsonKey(name: "avgvis_miles") final int? avgvisMiles,
    @JsonKey(name: "avghumidity") final int? avghumidity,
    @JsonKey(name: "daily_will_it_rain") final int? dailyWillItRain,
    @JsonKey(name: "daily_chance_of_rain") final int? dailyChanceOfRain,
    @JsonKey(name: "daily_will_it_snow") final int? dailyWillItSnow,
    @JsonKey(name: "daily_chance_of_snow") final int? dailyChanceOfSnow,
    @JsonKey(name: "condition") final ConditionApiDto? condition,
    @JsonKey(name: "uv") final int? uv,
  }) = _DayApiDto;
  const DayApiDto._();

  factory DayApiDto.fromJson(Map<String, dynamic> json) =>
      _$DayApiDtoFromJson(json);
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
class AstroApiDto with _$AstroApiDto implements ApiCacheDto<AstroCacheDto> {
  const factory AstroApiDto({
    @JsonKey(name: "sunrise") final String? sunrise,
    @JsonKey(name: "sunset") final String? sunset,
    @JsonKey(name: "moonrise") final String? moonrise,
    @JsonKey(name: "moonset") final String? moonset,
    @JsonKey(name: "moon_phase") final String? moonPhase,
    @JsonKey(name: "moon_illumination") final int? moonIllumination,
    @JsonKey(name: "is_moon_up") final int? isMoonUp,
    @JsonKey(name: "is_sun_up") final int? isSunUp,
  }) = _AstroApiDto;
  const AstroApiDto._();

  factory AstroApiDto.fromJson(Map<String, dynamic> json) =>
      _$AstroApiDtoFromJson(json);
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
class HourApiDto with _$HourApiDto implements ApiCacheDto<HourCacheDto> {
  const factory HourApiDto({
    @JsonKey(name: "time_epoch") final int? timeEpoch,
    @JsonKey(name: "time") final String? time,
    @JsonKey(name: "temp_c") final double? tempC,
    @JsonKey(name: "temp_f") final double? tempF,
    @JsonKey(name: "is_day") final int? isDay,
    @JsonKey(name: "condition") final ConditionApiDto? condition,
    @JsonKey(name: "wind_mph") final double? windMph,
    @JsonKey(name: "wind_kph") final double? windKph,
    @JsonKey(name: "wind_degree") final int? windDegree,
    @JsonKey(name: "wind_dir") final String? windDir,
    @JsonKey(name: "pressure_mb") final int? pressureMb,
    @JsonKey(name: "pressure_in") final double? pressureIn,
    @JsonKey(name: "precip_mm") final double? precipMm,
    @JsonKey(name: "precip_in") final double? precipIn,
    @JsonKey(name: "snow_cm") final int? snowCm,
    @JsonKey(name: "humidity") final int? humidity,
    @JsonKey(name: "cloud") final int? cloud,
    @JsonKey(name: "feelslike_c") final double? feelslikeC,
    @JsonKey(name: "feelslike_f") final double? feelslikeF,
    @JsonKey(name: "windchill_c") final double? windchillC,
    @JsonKey(name: "windchill_f") final double? windchillF,
    @JsonKey(name: "heatindex_c") final double? heatindexC,
    @JsonKey(name: "heatindex_f") final double? heatindexF,
    @JsonKey(name: "dewpoint_c") final double? dewpointC,
    @JsonKey(name: "dewpoint_f") final double? dewpointF,
    @JsonKey(name: "will_it_rain") final int? willItRain,
    @JsonKey(name: "chance_of_rain") final int? chanceOfRain,
    @JsonKey(name: "will_it_snow") final int? willItSnow,
    @JsonKey(name: "chance_of_snow") final int? chanceOfSnow,
    @JsonKey(name: "vis_km") final int? visKm,
    @JsonKey(name: "vis_miles") final int? visMiles,
    @JsonKey(name: "gust_mph") final double? gustMph,
    @JsonKey(name: "gust_kph") final double? gustKph,
    @JsonKey(name: "uv") final int? uv,
  }) = _HourApiDto;
  const HourApiDto._();

  factory HourApiDto.fromJson(Map<String, dynamic> json) =>
      _$HourApiDtoFromJson(json);
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
