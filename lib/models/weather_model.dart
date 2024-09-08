import 'package:flutter/material.dart';

class WeatherModel {
  String? date;
  double? temp;
  double? maxtemp;
  double? mintemp;
  String? weatherStateName;
  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weatherStateName,
  });
  factory WeatherModel.fromJson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsondata['avgtemp_c'],
      maxtemp: jsondata['maxtemp_c'],
      mintemp: jsondata['mintemp_c'],
      weatherStateName: jsondata['condition']['text'],
    );
  }
  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'||weatherStateName=='Sunny') {
      return 'assets/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/Snow.png';
    } else if (weatherStateName == 'Heavy Cloud'||weatherStateName=='Partly Cloudy') {
      return 'assets/cloudy.png';
    }else if(weatherStateName=='Light Rain'||weatherStateName=='Heavy rain'){
      return 'assets/rainy.png';
    }else if (weatherStateName=='Thunder'||weatherStateName=='Thunderstorm'){
      return 'assets/thunderstorm.png';
    }else{
      return 'assets/clear.png';
    }
  }

    MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'||weatherStateName=='Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud'||weatherStateName=='Partly Cloudy') {
      return Colors.blueGrey;
    }else if(weatherStateName=='Light Rain'||weatherStateName=='Heavy rain'){
      return Colors.blue;
    }else if (weatherStateName=='Thunder'||weatherStateName=='Thunderstorm'){
      return Colors.indigo;
    }else{
      return Colors.green ;
    }
  }
}
