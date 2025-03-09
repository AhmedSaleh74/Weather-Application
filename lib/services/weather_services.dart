import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  WeatherServices({required this.dio});

  Future<List<WeatherModel>> getWeather(String city) async {
    final apiKey = 'db0df7e257265619dbd06c8dc6313a5a';
    final response = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather',
      queryParameters: {
        'q': city,
        'appid': apiKey,
        'units': 'metric',
        'lang': 'ar',
        'cnt': 5,
      },
    );
    List<WeatherModel> weatherData = [];
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = response.data;
      weatherData.add(
        WeatherModel(
          temp: '${jsonData['main']['temp']}°C',
          tempMin: '${jsonData['main']['temp_min']}°C',
          tempMax: '${jsonData['main']['temp_max']}°C',
          description: '${jsonData['weather'][0]['description']}',
          main: '${jsonData['weather'][0]['main']}',
        ),
      );
    }
    return weatherData;
  }
}
