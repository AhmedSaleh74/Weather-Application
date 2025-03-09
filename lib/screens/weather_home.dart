import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/city_weather.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade900,
              Colors.purple.shade900,
              Colors.black
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Enter the City',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      label: Text(
                        'City here',
                        style: TextStyle(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        gapPadding: 4.0,
                      )),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final List<WeatherModel> weatherData =
                        await WeatherServices(dio: Dio())
                            .getWeather(cityController.text);
                    if (weatherData.isNotEmpty) {
                      print("Weather Data Retrieved Successfully ✅");
                      final temp = weatherData[0].temp;
                      final tempMin = weatherData[0].tempMin;
                      final tempMax = weatherData[0].tempMax;
                      final description = weatherData[0].description;
                      final main = weatherData[0].main;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityWeather(
                              cityName: cityController.text,
                              temp: temp,
                              tempMin: tempMin,
                              tempMax: tempMax,
                              description: description,
                              main: main),
                        ),
                      );
                    } else {
                      print(
                          "⚠️ No data found for city: ${cityController.text}");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                  ),
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
