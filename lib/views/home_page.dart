import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/views/search_page.dart';
import 'package:weather_app/widgets/no_weather_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 32,
                ))
          ],
          backgroundColor: Provider.of<WeatherProvider>(context).weatherData?.getThemeColor(),
          title: const Text(
            'Weather App',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: weatherData == null
            ? NoWeatherBody()
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors:[ weatherData!.getThemeColor(),
                  Colors.white70
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${Provider.of<WeatherProvider>(context).cityName}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                   const Text(
                      'updated Today ',
                      style: TextStyle(fontSize: 18),
                    ),
                   const SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(
                          '${weatherData?.temp?.toInt()}',
                          style: TextStyle(fontSize: 35),
                        ),
                        Column(
                          children: [
                            Text(
                              'Maxtemp:  ${weatherData?.maxtemp?.toInt()}',
                            ),
                            Text(
                              'Mintemp:  ${weatherData?.mintemp?.toInt()}',
                            )
                          ],
                        )
                      ],
                    ),
                   const SizedBox(height: 20),
                    Text(
                      '${weatherData?.weatherStateName}',
                      style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                   const SizedBox(
                      height: 190,
                    )
                  ],
                ),
              ));
  }
}
