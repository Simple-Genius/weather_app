import 'package:flutter/material.dart';
import 'package:weather_app/screens/FutureWeatherPage.dart';
import 'package:weather_icons/weather_icons.dart';
import 'WeatherData.dart';
import 'constants.dart';



buildWeatherRow(String day, double actualTemp, double feelsLike, String iconUrl ){
     return TableRow(
        children: [
          Text(day, style: rowTextStyle),
           Text('$actualTemp° $feelsLike°',style: rowTextStyle,),
           Image.network(iconUrl)
        ],
    );
  }







