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
    required this.icon,
  });
  final String cityName;
  final double temp;
  final String tempMin;
  final String tempMax;
  final String description;
  final String main;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: temp < 20
                ? [
                    Colors.blue.shade900,
                    Colors.lightBlue.shade400,
                    Colors.cyan.shade300
                  ]
                : [
                    Colors.red.shade900,
                    Colors.orange.shade600,
                    Colors.amber.shade500
                  ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                cityName.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                      'https://openweathermap.org/img/wn/$icon@2x.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 30,
                      children: [
                        Text(
                          '$temp',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Text(
                          description,
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'maxTemp : $tempMax',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          'minTemp : $tempMin',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
