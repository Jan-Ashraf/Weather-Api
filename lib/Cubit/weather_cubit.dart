import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_api/Models/weather_model.dart';
import 'package:weather_api/Services/weather_services.dart';

import '../Services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());


  late final WeatherService weatherService = WeatherService();


  Future<void> getNews(String nameCity) async {
    emit(WeatherLoading());
    try{
      final List<WeatherModel> WeatherList = await weatherService.getWeather(nameCity: nameCity);
      emit(WeatherLoaded(WeatherList));
    } catch (e) {
      emit(WeatherError());
    }
  }
}
