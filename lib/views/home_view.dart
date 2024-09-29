import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_states.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.location_searching_outlined,
                size: 34,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
          title: const Text(
            'search for a location',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 26),
          ),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return NoWeatherBody();
            } else if (state is LoadedWeatherState) {
              return WeatherInfoBody();
            } else {
              return Text("Oops there seems to be an error");
            }
          },
        ));
  }
}
