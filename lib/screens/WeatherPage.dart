
import 'dart:developer';

import 'package:provider/provider.dart';
import 'package:weather_app/WeatherData.dart';
import 'package:weather_app/WeatherModel.dart';
import 'package:weather_app/screens/FutureWeatherPage.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';


import '../WeatherCard.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<WeatherModel> weatherModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherModel = context.read<WeatherData>().fetchData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherModel>(
        future: weatherModel,
        builder: (context,snapshot) {
          if(snapshot.hasError){
            log(snapshot.error.toString());
          }
          if(snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              color: const Color(0xFF71f1ed),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Icon(
                          Icons.location_on,
                          color: kTextColor,
                        ),
                      ),
                      const Text(
                        'San Francisco',
                        style: TextStyle(color: kTextColor, fontSize: 17),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FutureWeatherPage()));
                          },
                          icon: const Icon(
                            Icons.date_range,
                            color: kTextColor,
                          )
                      ),

                    ],
                  ),
                ),
                Image.network(snapshot.data!.iconUrl, scale: 0.4),
                 Text(
                  snapshot.data!.description,
                  style: const TextStyle(color: kTextColor, fontSize: 16),
                ),
                 Text(
                  '${snapshot.data!.currentTemperature.ceil()}°',
                  style: const TextStyle(
                      color: kTextColor,
                      fontSize: 70,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const BoxedIcon(
                      WeatherIcons.strong_wind,
                      color: kTextColor,
                    ),
                    Text('${snapshot.data!.windSpeed.ceil()}km/h'),
                    const BoxedIcon(WeatherIcons.raindrop, color: kTextColor),
                    Text('${snapshot.data!.humidity}%')
                  ],
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 55.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                       children:
                      [
                        WeatherCard(
                          date: snapshot.data!.dates[0].split(' ')[0],
                          temperature: snapshot.data!.futureTemperatureList[0].ceil().toString(),
                          time: snapshot.data!.dates[0].split(' ')[1],
                          imgUrl: snapshot.data!.images[0]),
                        WeatherCard(
                          date: snapshot.data!.dates[1].split(' ')[0],
                          temperature: snapshot.data!.futureTemperatureList[1].ceil().toString(),
                          time: snapshot.data!.dates[1].split(' ')[1], imgUrl: snapshot.data!.images[1],),
                        WeatherCard(
                          date: snapshot.data!.dates[2].split(' ')[0],
                          temperature: snapshot.data!.futureTemperatureList[2].ceil().toString(),
                          time: snapshot.data!.dates[2].split(' ')[1],
                            imgUrl: snapshot.data!.images[2]
                        ),

                      ],
                    ),
                  ),
                )
              ]),
            );
          }
          return  Container(color: kBackgroundColor,child: const Center(child: CircularProgressIndicator( color: kTextColor,)));
        }
      ),
    );
  }
}

