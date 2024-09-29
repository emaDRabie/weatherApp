import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = '9c62d400eadc4c75b4f200253241608';
  WeatherServices({required this.dio});

  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          "ops there seem to be a problem try again later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("ops there seem to be a problem try again later");
    }
  }
}
