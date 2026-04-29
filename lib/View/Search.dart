import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/View/WeatherCity.dart';

import '../Cubit/weather_cubit.dart';

class searchView extends StatelessWidget {
  const searchView({super.key, required this.nameCity});
  
  final String nameCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search City'),
        ),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter city name",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),

                onSubmitted: (value) {
                  BlocProvider.of<WeatherCubit>(context).getNews(value);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  WeatherCity()),
                  );
                },
              ),
            ),
        ),
    );
  }
}
