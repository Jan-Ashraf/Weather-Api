import 'package:flutter/foundation.dart';

class WeatherModel{
  final String? name;
  final String? update;
  final String? condition;
  final double? currentT;
  final double? maxT;
  final double? minT;

  WeatherModel({this.name,this.update,this.condition,this.currentT, this.maxT, this.minT});

  factory WeatherModel.fromJson(json){
    return WeatherModel(
      name: json['location']['name'],
      update: json['current']['last_updated'],
      condition: json['current']['condition']['text'],
      currentT: json['current']['temp_c'],
      maxT: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minT: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}

