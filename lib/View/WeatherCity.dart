import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_api/Cubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCity extends StatefulWidget {
  const WeatherCity({super.key});

  @override
  State<WeatherCity> createState() => _WeatherCityState();
}

class _WeatherCityState extends State<WeatherCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if(state is WeatherLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is WeatherError){
            return Center(
              child: Text("Error"),
            );
          }
          if(state is WeatherLoaded){
            return Center(
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${state.weatherList[0].name}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Text("Updated at: ${state.weatherList[0].update}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${state.weatherList[0].currentT}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      SizedBox(width: 100 ,),
                      Column(
                        children: [
                          Text("Max Temp: ${state.weatherList[0].maxT}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text("Min Temp: ${state.weatherList[0].minT}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("${state.weatherList[0].condition}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                ],
              ),
            );
          }
          return Text("data");
        },
      ),

    );
  }
}
