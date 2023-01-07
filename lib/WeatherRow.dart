import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constants.dart';



buildWeatherRow(String day, String actualTemp, String feelsLike, String iconUrl ){
     return TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(DateFormat('EEEE').format(DateTime.parse(day)), style: rowTextStyle),
          ),
           Padding(
             padding: const EdgeInsets.only(bottom: 15.0),
             child: Text('$actualTemp°  $feelsLike°',style: rowTextStyle,),
           ),
           Padding(
             padding: const EdgeInsets.only(bottom: 15.0),
             child: Image.network(iconUrl),
           )
        ],
    );
  }







