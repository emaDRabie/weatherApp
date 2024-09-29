import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

import 'get_current_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;

  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices(dio: Dio()).getCurrentWeather(cityName);
      emit(LoadedWeatherState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
