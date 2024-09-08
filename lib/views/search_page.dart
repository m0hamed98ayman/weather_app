import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_survices.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffad3b),
        title: const Text(
          'Search a City',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherSurvices survice = WeatherSurvices();
              WeatherModel weather =
                  await survice.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            autofocus: false,
            decoration: const InputDecoration(
              label: Text('search', style: TextStyle(fontSize: 22)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              border: OutlineInputBorder(),
              hintText: 'Inter a City name ',
              suffixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
