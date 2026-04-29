part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState{}
final class WeatherLoaded extends WeatherState{
  List<WeatherModel> weatherList = [];
  WeatherLoaded(this.weatherList);

}
final class WeatherError extends WeatherState{}

