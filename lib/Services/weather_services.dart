import 'package:dio/dio.dart';
import 'package:weather_api/Models/weather_model.dart';

class WeatherService{
  final Dio dio = Dio();


  Future<List<WeatherModel>> getWeather ({required String nameCity}) async{
    try{
      var response = await dio.get("http://api.weatherapi.com/v1/forecast.json?q=$nameCity&key=9c99b2361d29460ca8a123811261803");

      Map<String, dynamic> data = response.data;


      List<WeatherModel> list = [WeatherModel.fromJson(data)];

      return list;

    }
    catch(e){
      print(
        "error: $e",
      );
      rethrow;
    }
  }
}