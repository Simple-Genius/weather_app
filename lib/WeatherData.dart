import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/WeatherModel.dart';
import 'package:weather_app/screens/FutureWeatherPage.dart';


class WeatherData with ChangeNotifier{

  static String cityName = 'Paris';
  //https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}
  //http://api.openweathermap.org/data/2.5/forecast?q=$cityname&appid=6f3bdd437289ce8ad6496faf1c70a590
  //http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=6f3bdd437289ce8ad6496faf1c70a590&units=imperial
  late WeatherModel weatherModel;

  static String url = 'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=6f3bdd437289ce8ad6496faf1c70a590&units=imperial';
    Future<WeatherModel> fetchData() async {
     final response  = await http.get(Uri.parse(url));
     print(response.body);
     if (response.statusCode == 200){
        weatherModel  = WeatherModel.fromJson(jsonDecode(response.body));
        return weatherModel;
     }
     else{
       throw Exception('Failed to load response');
     }
   }



  @override
  notifyListeners();
}