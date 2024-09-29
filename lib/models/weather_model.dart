class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.weatherCondition,
    this.image,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        date: DateTime.parse(json['current']['last_updated']),
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c']);
  }
}
