import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/WeatherModel.dart';
import 'package:weather_app/screens/FutureWeatherPage.dart';

class WeatherData with ChangeNotifier {
  static String cityName = "Paris";
  late WeatherModel weatherModel;

  static String url =
      'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=6f3bdd437289ce8ad6496faf1c70a590&units=imperial';
  Future<WeatherModel> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      weatherModel = WeatherModel.fromJson(jsonDecode(response.body));
      return weatherModel;
    } else {
      throw Exception('Failed to load response');
    }
  }

  @override
  notifyListeners();
}
