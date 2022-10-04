import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/WeatherData.dart';
import 'package:weather_app/WeatherModel.dart';
import 'package:weather_app/constants.dart';
import '../WeatherRow.dart';


class FutureWeatherPage extends StatefulWidget {
  const FutureWeatherPage({Key? key}) : super(key: key);

  @override
  _FutureWeatherPageState createState() => _FutureWeatherPageState();
}

class _FutureWeatherPageState extends State<FutureWeatherPage> {
  String _dropDownValue = 'Canada';
  List<String> items = ['Canada', 'Kenya', 'Australia', 'Malawi'];
  late Future<WeatherModel> futureWeather;


  var dateFormate = DateFormat("dd-MM-yyyy").format(DateTime.parse("2019-09-30"));

  @override
  void initState()  {
    //log(dateFormate);
   log((DateFormat('EEEE').format(DateTime.parse("2022-10-04")).toString()));
    // TODO: implement initState
    super.initState();
    futureWeather = context.read<WeatherData>().fetchData();
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: FutureBuilder<WeatherModel>(
        future: futureWeather,
        builder: (context,snapshot) {

          List<TableRow> buildRows(){
            List<TableRow> tableList = [];
              for (int i = 0; i < snapshot.data!.dates.length; i++){
                tableList.add(buildWeatherRow(
                    snapshot.data!.dates[i],
                    snapshot.data!.futureTemperatureList[i].ceil().toString(),
                    snapshot.data!.futureFeelsLikeList[i].ceil().toString(),
                    snapshot.data!.images[i]));
              }
              log('${tableList.length}  ${snapshot.data!.futureTemperatureList.length}');
            return tableList;
          }

          if(snapshot.hasData){
            return Container(
              color: kFuturePageColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                          Icons.keyboard_backspace,
                          color: Colors.white,
                        ),
                            onPressed: (){
                            Navigator.of(context).pop();
                            }
                        ),
                        Expanded(
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: Colors.black12,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                value: _dropDownValue,
                                items: items.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _dropDownValue = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 40),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kFuturePageTextColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(child: Text('15 minutes ago\n'
                            'The wind is very strong today! This\n '
                            'is not the time for a yacht trip.',
                          style: TextStyle(
                              color: Color(0xffbbbec2),
                              fontSize: 17
                          ),
                        ),),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Next week ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Table(
                          columnWidths: const {
                            0: FixedColumnWidth(150),
                            2: FixedColumnWidth(30)
                          },
                          children: buildRows(),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return  Container(color: kFuturePageColor,child: const Center(child: CircularProgressIndicator( color: Colors.white,)));
        }
      )

    );
  }


}



