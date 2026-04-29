import 'package:flutter/material.dart';
import 'package:weather_api/Cubit/weather_cubit.dart';
import 'package:weather_api/View/Search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => searchView(nameCity: "Cairo",),)
            );
          },
        )],
      ),
      body: Center(
        child: Text('There is no Weather Start Searching now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),textAlign: TextAlign.center,),
      ),
    );
  }
}

