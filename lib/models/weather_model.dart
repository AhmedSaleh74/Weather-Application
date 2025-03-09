class WeatherModel {
  final double temp;
  final String tempMin;
  final String tempMax;
  final String description;
  final String main;
  final String icon;
  WeatherModel({
    required this.temp,
    required this.description,
    required this.tempMax,
    required this.tempMin,
    required this.main,
    required this.icon,
  });
}
