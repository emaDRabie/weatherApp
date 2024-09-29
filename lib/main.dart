import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_states.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) => MaterialApp(
                  theme: ThemeData(
                    appBarTheme: AppBarTheme(
                      backgroundColor: getThemeColor(
                          BlocProvider.of<GetWeatherCubit>(context)
                              .weatherModel
                              ?.weatherCondition),
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      iconTheme: IconThemeData(
                        color:
                            Colors.white, // Sets the color for the AppBar icons
                      ),
                    ),
                  ),
                  debugShowCheckedModeBanner: false,
                  home: HomeView(),
                ),
              )),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.amber;
    case "Partly cloudy":
      return Colors.lightBlue;
    case "Cloudy":
    case "Overcast":
      return Colors.grey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy rain possible":
    case "Light drizzle":
    case "Patchy light drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Light rain shower":
      return Colors.blue;
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
      return Colors.blue;
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple;
    case "Patchy snow possible":
    case "Patchy light snow":
    case "Light snow":
    case "Light snow showers":
      return Colors.lightBlue;
    case "Moderate snow":
    case "Moderate or heavy snow showers":
    case "Moderate or heavy snow with thunder":
      return Colors.lightBlue;
    case "Patchy sleet possible":
    case "Light sleet":
    case "Light sleet showers":
      return Colors.lightBlue;
    case "Moderate or heavy sleet":
    case "Moderate or heavy sleet showers":
      return Colors.lightBlue;
    case "Blizzard":
    case "Heavy snow":
    case "Patchy heavy snow":
      return Colors.grey;
    case "Blowing snow":
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.blueGrey;
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Heavy freezing drizzle":
      return Colors.cyan;
    default:
      return Colors.blueGrey;
  }
}
