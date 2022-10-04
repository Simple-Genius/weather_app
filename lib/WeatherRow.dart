import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constants.dart';



buildWeatherRow(String day, String actualTemp, String feelsLike, String iconUrl ){
     return TableRow(
        children: [
          Text(DateFormat('EEEE').format(DateTime.parse(day)), style: rowTextStyle),
           Text('$actualTemp°  $feelsLike°',style: rowTextStyle,),
           Image.network(iconUrl)
        ],
    );
  }







