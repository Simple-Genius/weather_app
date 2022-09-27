import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'constants.dart';


buildWeatherRow(){
  List<TableRow> _tableRow = [];
  for (String day in days){
    _tableRow.add(
      TableRow(
        children: [
          Text(day, style: rowTextStyle),
          const Text('28° 21°',style: rowTextStyle,),
          const BoxedIcon(WeatherIcons.day_cloudy)
        ],
      ),
    );
  }
  return _tableRow;
}