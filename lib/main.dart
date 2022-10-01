import 'package:flutter/material.dart';
import 'package:weather_app/screens/WeatherPage.dart';
import 'package:provider/provider.dart';

import 'WeatherData.dart';
import 'screens/FutureWeatherPage.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WeatherData()),
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FutureWeatherPage(),
    );
  }
}
