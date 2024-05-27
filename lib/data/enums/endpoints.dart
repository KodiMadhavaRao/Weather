enum EndPoints {
  weather,
}

extension EndPointsBuilder on EndPoints {
  String val<T>({T? data}) {
    switch (this) {
      case EndPoints.weather:
        return "forecast.json";
    }
  }
}
