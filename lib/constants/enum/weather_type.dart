enum WeatherType { hourly, daily }

extension WeatherTypeExtension on WeatherType{
  String get exlude{
    switch (this) {
      case WeatherType.daily:
        return "minutely, hourly";
      case WeatherType.hourly:
        return "minutely, daily";
    }
  }

  String toStr(){
    switch (this) {
      case WeatherType.daily:
        return "daily";
      case WeatherType.hourly:
        return "hourly";
    }
  }
}