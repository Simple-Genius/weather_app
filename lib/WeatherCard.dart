import 'package:flutter/material.dart';

import 'constants.dart';

class WeatherCard extends StatelessWidget {

  final String date;
  final String time;
  final String temperature;
  final String imgUrl;

  const WeatherCard({
    Key? key, required this.date, required this.time, required this.temperature, required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Text(date),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kBottomContainerColor),
            height: 150,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      time, //add appropriate font
                      style: const TextStyle(
                        color: kTextColor,
                        fontSize: 17,
                      ),
                    ),
                    Image.network(imgUrl),
                    Text(
                      temperature + '°',
                      style: const TextStyle(color: kTextColor, fontSize: 17),
                    )
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
