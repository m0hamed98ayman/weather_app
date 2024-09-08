import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_survices.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.weatherSurvices,super.initialState);

  WeatherSurvices? weatherSurvices ;
  WeatherModel? weatherModel ;
  void getWeather({required String cityName}) async 
  {
     emit(WeatherLoading());
     try {
      weatherModel = await weatherSurvices!.getWeather(cityName:cityName );
      emit(WeatherSuccess());
     }on Exception {
       emit(WeatherFailure());
     }
  }
  
}
