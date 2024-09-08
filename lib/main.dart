import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/views/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child:const WeatherApp()));
}

WeatherProvider? WeatherData;

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Provider.of<WeatherProvider>(context).weatherData?.getThemeColor(),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      
    );
  }
}
