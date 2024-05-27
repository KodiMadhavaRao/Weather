import 'package:hive/hive.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/mappers/cache_dto.dart';
import '../../../../domain/models/weather/weather.dart';
import '../../api/weather/weather_api_dto.dart';

part 'weather_cache_dto.g.dart';

@HiveType(typeId: AppConstants.weatherAdapterId)
class WeatherCacheDto
    with HiveObjectMixin
    implements CacheDto<Weather, WeatherApiDto> {
  static String boxKey = AppConstants.weatherBoxKey;

  @HiveField(0)
  final LocationCacheDto? location;

  @HiveField(1)
  final CurrentCacheDto? current;

  @HiveField(2)
  final ForecastCacheDto? forecast;

  @override
  @HiveField(3)
  String? syncTime;

  @override
  @HiveField(4)
  bool? isSynced;

  WeatherCacheDto({
    this.location,
    this.current,
    this.forecast,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number =>
      AppConstants.weatherBoxKey; //Update id to your unique value

  @override
  Weather toModel() => Weather(
        location: location?.toModel(),
        current: current?.toModel(),
        forecast: forecast?.toModel(),
      );

  @override
  WeatherApiDto toApiDto() => WeatherApiDto(
        location: location?.toApiDto(),
        current: current?.toApiDto(),
        forecast: forecast?.toApiDto(),
      );
}

@HiveType(typeId: AppConstants.locationAdapterId)
class LocationCacheDto
    with HiveObjectMixin
    implements CacheDto<Location, LocationApiDto> {
  static String boxKey = AppConstants.locationBoxKey;

  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? region;

  @HiveField(2)
  final String? country;

  @HiveField(3)
  final double? lat;

  @HiveField(4)
  final double? lon;

  @HiveField(5)
  final String? tzId;

  @HiveField(6)
  final int? localtimeEpoch;

  @HiveField(7)
  final String? localtime;

  @override
  @HiveField(8)
  String? syncTime;

  @override
  @HiveField(9)
  bool? isSynced;

  LocationCacheDto({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number =>
      AppConstants.locationBoxKey; //Update id to your unique value

  @override
  Location toModel() => Location(
        name: name,
        region: region,
        country: country,
        lat: lat,
        lon: lon,
        tzId: tzId,
        localtimeEpoch: localtimeEpoch,
        localtime: localtime,
      );

  @override
  LocationApiDto toApiDto() => LocationApiDto(
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

@HiveType(typeId: AppConstants.currentAdapterId)
class CurrentCacheDto
    with HiveObjectMixin
    implements CacheDto<Current, CurrentApiDto> {
  static String boxKey = AppConstants.currentBoxKey;

  @HiveField(0)
  final int? lastUpdatedEpoch;

  @HiveField(1)
  final String? lastUpdated;

  @HiveField(2)
  final double? tempC;

  @HiveField(3)
  final double? tempF;

  @HiveField(4)
  final int? isDay;

  @HiveField(5)
  final ConditionCacheDto? condition;

  @HiveField(6)
  final double? windMph;

  @HiveField(7)
  final double? windKph;

  @HiveField(8)
  final int? windDegree;

  @HiveField(9)
  final String? windDir;

  @HiveField(10)
  final double? pressureMb;

  @HiveField(11)
  final double? pressureIn;

  @HiveField(12)
  final double? precipMm;

  @HiveField(13)
  final double? precipIn;

  @HiveField(14)
  final int? humidity;

  @HiveField(15)
  final int? cloud;

  @HiveField(16)
  final double? feelslikeC;

  @HiveField(17)
  final double? feelslikeF;

  @HiveField(18)
  final double? visKm;

  @HiveField(19)
  final double? visMiles;

  @HiveField(20)
  final double? uv;

  @HiveField(21)
  final double? gustMph;

  @HiveField(22)
  final double? gustKph;

  @override
  @HiveField(23)
  String? syncTime;

  @override
  @HiveField(24)
  bool? isSynced;

  CurrentCacheDto({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number =>
      AppConstants.currentBoxKey; //Update id to your unique value

  @override
  Current toModel() => Current(
        lastUpdatedEpoch: lastUpdatedEpoch,
        lastUpdated: lastUpdated,
        tempC: tempC,
        tempF: tempF,
        isDay: isDay,
        condition: condition?.toModel(),
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

  @override
  CurrentApiDto toApiDto() => CurrentApiDto(
        lastUpdatedEpoch: lastUpdatedEpoch,
        lastUpdated: lastUpdated,
        tempC: tempC,
        tempF: tempF,
        isDay: isDay,
        condition: condition?.toApiDto(),
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

@HiveType(typeId: AppConstants.conditionAdapterId)
class ConditionCacheDto
    with HiveObjectMixin
    implements CacheDto<Condition, ConditionApiDto> {
  static String boxKey = AppConstants.conditionBoxKey;

  @HiveField(0)
  final String? text;

  @HiveField(1)
  final String? icon;

  @HiveField(2)
  final int? code;

  @override
  @HiveField(3)
  String? syncTime;

  @override
  @HiveField(4)
  bool? isSynced;

  ConditionCacheDto({
    this.text,
    this.icon,
    this.code,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number =>
      AppConstants.conditionBoxKey; //Update id to your unique value

  @override
  Condition toModel() => Condition(
        text: text,
        icon: icon,
        code: code,
      );

  @override
  ConditionApiDto toApiDto() => ConditionApiDto(
        text: text,
        icon: icon,
        code: code,
      );
}

@HiveType(typeId: AppConstants.forecastAdapterId)
class ForecastCacheDto
    with HiveObjectMixin
    implements CacheDto<Forecast, ForecastApiDto> {
  static String boxKey = AppConstants.forecastBoxKey;

  @HiveField(0)
  final List<ForecastdayCacheDto>? forecastday;

  @override
  @HiveField(1)
  String? syncTime;

  @override
  @HiveField(2)
  bool? isSynced;

  ForecastCacheDto({
    this.forecastday,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number =>
      AppConstants.forecastBoxKey; //Update id to your unique value

  @override
  Forecast toModel() => Forecast(
        forecastday: forecastday?.map((e) => e.toModel()).toList(),
      );

  @override
  ForecastApiDto toApiDto() => ForecastApiDto(
        forecastday: forecastday?.map((e) => e.toApiDto()).toList(),
      );
}

@HiveType(typeId: AppConstants.forecastdayAdapterId)
class ForecastdayCacheDto
    with HiveObjectMixin
    implements CacheDto<Forecastday, ForecastdayApiDto> {
  static String boxKey = AppConstants.forecastdayBoxKey;

  @HiveField(0)
  final String? date;

  @HiveField(1)
  final int? dateEpoch;

  @HiveField(2)
  final DayCacheDto? day;

  @HiveField(3)
  final AstroCacheDto? astro;

  @HiveField(4)
  final List<HourCacheDto>? hour;

  @override
  @HiveField(5)
  String? syncTime;

  @override
  @HiveField(6)
  bool? isSynced;

  ForecastdayCacheDto({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number =>
      AppConstants.forecastdayBoxKey; //Update id to your unique value

  @override
  Forecastday toModel() => Forecastday(
        date: date,
        dateEpoch: dateEpoch,
        day: day?.toModel(),
        astro: astro?.toModel(),
        hour: hour?.map((e) => e.toModel()).toList(),
      );

  @override
  ForecastdayApiDto toApiDto() => ForecastdayApiDto(
        date: date,
        dateEpoch: dateEpoch,
        day: day?.toApiDto(),
        astro: astro?.toApiDto(),
        hour: hour?.map((e) => e.toApiDto()).toList(),
      );
}

@HiveType(typeId: AppConstants.dayAdapterId)
class DayCacheDto with HiveObjectMixin implements CacheDto<Day, DayApiDto> {
  static String boxKey = AppConstants.dayBoxKey;

  @HiveField(0)
  final double? maxtempC;

  @HiveField(1)
  final double? maxtempF;

  @HiveField(2)
  final int? mintempC;

  @HiveField(3)
  final double? mintempF;

  @HiveField(4)
  final double? avgtempC;

  @HiveField(5)
  final double? avgtempF;

  @HiveField(6)
  final double? maxwindMph;

  @HiveField(7)
  final double? maxwindKph;

  @HiveField(8)
  final double? totalprecipMm;

  @HiveField(9)
  final double? totalprecipIn;

  @HiveField(10)
  final int? totalsnowCm;

  @HiveField(11)
  final int? avgvisKm;

  @HiveField(12)
  final int? avgvisMiles;

  @HiveField(13)
  final int? avghumidity;

  @HiveField(14)
  final int? dailyWillItRain;

  @HiveField(15)
  final int? dailyChanceOfRain;

  @HiveField(16)
  final int? dailyWillItSnow;

  @HiveField(17)
  final int? dailyChanceOfSnow;

  @HiveField(18)
  final ConditionCacheDto? condition;

  @HiveField(19)
  final int? uv;

  @override
  @HiveField(20)
  String? syncTime;

  @override
  @HiveField(21)
  bool? isSynced;

  DayCacheDto({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number => AppConstants.dayBoxKey; //Update id to your unique value

  @override
  Day toModel() => Day(
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
        condition: condition?.toModel(),
        uv: uv,
      );

  @override
  DayApiDto toApiDto() => DayApiDto(
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
        condition: condition?.toApiDto(),
        uv: uv,
      );
}

@HiveType(typeId: AppConstants.astroAdapterId)
class AstroCacheDto
    with HiveObjectMixin
    implements CacheDto<Astro, AstroApiDto> {
  static String boxKey = AppConstants.astroBoxKey;

  @HiveField(0)
  final String? sunrise;

  @HiveField(1)
  final String? sunset;

  @HiveField(2)
  final String? moonrise;

  @HiveField(3)
  final String? moonset;

  @HiveField(4)
  final String? moonPhase;

  @HiveField(5)
  final int? moonIllumination;

  @HiveField(6)
  final int? isMoonUp;

  @HiveField(7)
  final int? isSunUp;

  @override
  @HiveField(8)
  String? syncTime;

  @override
  @HiveField(9)
  bool? isSynced;

  AstroCacheDto({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number =>
      AppConstants.astroBoxKey; //Update id to your unique value

  @override
  Astro toModel() => Astro(
        sunrise: sunrise,
        sunset: sunset,
        moonrise: moonrise,
        moonset: moonset,
        moonPhase: moonPhase,
        moonIllumination: moonIllumination,
        isMoonUp: isMoonUp,
        isSunUp: isSunUp,
      );

  @override
  AstroApiDto toApiDto() => AstroApiDto(
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

@HiveType(typeId: AppConstants.hourAdapterId)
class HourCacheDto with HiveObjectMixin implements CacheDto<Hour, HourApiDto> {
  static String boxKey = AppConstants.hourBoxKey;

  @HiveField(0)
  final int? timeEpoch;

  @HiveField(1)
  final String? time;

  @HiveField(2)
  final double? tempC;

  @HiveField(3)
  final double? tempF;

  @HiveField(4)
  final int? isDay;

  @HiveField(5)
  final ConditionCacheDto? condition;

  @HiveField(6)
  final double? windMph;

  @HiveField(7)
  final double? windKph;

  @HiveField(8)
  final int? windDegree;

  @HiveField(9)
  final String? windDir;

  @HiveField(10)
  final int? pressureMb;

  @HiveField(11)
  final double? pressureIn;

  @HiveField(12)
  final double? precipMm;

  @HiveField(13)
  final double? precipIn;

  @HiveField(14)
  final int? snowCm;

  @HiveField(15)
  final int? humidity;

  @HiveField(16)
  final int? cloud;

  @HiveField(17)
  final double? feelslikeC;

  @HiveField(18)
  final double? feelslikeF;

  @HiveField(19)
  final double? windchillC;

  @HiveField(20)
  final double? windchillF;

  @HiveField(21)
  final double? heatindexC;

  @HiveField(22)
  final double? heatindexF;

  @HiveField(23)
  final double? dewpointC;

  @HiveField(24)
  final double? dewpointF;

  @HiveField(25)
  final int? willItRain;

  @HiveField(26)
  final int? chanceOfRain;

  @HiveField(27)
  final int? willItSnow;

  @HiveField(28)
  final int? chanceOfSnow;

  @HiveField(29)
  final int? visKm;

  @HiveField(30)
  final int? visMiles;

  @HiveField(31)
  final double? gustMph;

  @HiveField(32)
  final double? gustKph;

  @HiveField(33)
  final int? uv;

  @override
  @HiveField(34)
  String? syncTime;

  @override
  @HiveField(35)
  bool? isSynced;

  HourCacheDto({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.snowCm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number => AppConstants.hourBoxKey; //Update id to your unique value

  @override
  Hour toModel() => Hour(
        timeEpoch: timeEpoch,
        time: time,
        tempC: tempC,
        tempF: tempF,
        isDay: isDay,
        condition: condition?.toModel(),
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

  @override
  HourApiDto toApiDto() => HourApiDto(
        timeEpoch: timeEpoch,
        time: time,
        tempC: tempC,
        tempF: tempF,
        isDay: isDay,
        condition: condition?.toApiDto(),
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
