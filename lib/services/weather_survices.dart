import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherSurvices {
  String baseURL = 'http://api.weatherapi.com/v1';
  String apiKey = '938178593c4f41e78b5123503232009';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
//*response * is an object of type *Response*
//to use this package you must put *http.* before every methode you need from this package
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
