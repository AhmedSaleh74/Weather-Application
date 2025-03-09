import 'package:flutter/material.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({
    super.key,
    required this.cityName,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.description,
    required this.main,
  });
  final String cityName;
  final String temp;
  final String tempMin;
  final String tempMax;
  final String description;
  final String main;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text('The weather of the $cityName'),
          Text(temp),
          Text(tempMax),
          Text(tempMin),
          Text(description),
        ],
      ),
    ));
  }
}
