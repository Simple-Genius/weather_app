class WeatherModel{
  late final double currentTemperature;
  final double windSpeed;
  final int humidity;
  final String description;
  final String iconUrl;
  final List<String> dates;
  final List<double> futureTemperatureList;
  final List<double> futureFeelsLikeList;
  final List<String> images;
  final List<double> weekly;

  WeatherModel({
    required this.weekly,
    required this.description,
    required this.dates,
    required this.iconUrl,
    required this.windSpeed,
    required this.humidity,
    required this.currentTemperature,
    required this.futureFeelsLikeList,
    required this.futureTemperatureList,
    required this.images,
  });



  factory WeatherModel.fromJson(Map<String, dynamic> json ){
    List<String> dateList = [];
    List<double> futureTemperature = [];
    List<String> images = [];
    List<double> weeklyTemperature = [];
    List<double> feelsLike = [];

  for(int i = 0; i < 40; i++){
    dateList.add(json['list'][i]['dt_txt']);
    futureTemperature.add(json['list'][i]['main']['temp']);
    images.add("http://openweathermap.org/img/w/" + json['list'][i]['weather'][0]['icon'] + '.png');
    i += 8;
  }
   dateList.add(json['list'][39]['dt_txt']);
   futureTemperature.add(json['list'][39]['main']['temp']);
   images.add("http://openweathermap.org/img/w/" + json['list'][39]['weather'][0]['icon'] + '.png');


    for (int i = 0; i < 40; i++){
    weeklyTemperature.add(json['list'][i]['main']['temp']);
    feelsLike.add(json['list'][i]['main']['feels_like']);
    i += 6;
  }
  weeklyTemperature.add(json['list'][39]['main']['temp']);
  feelsLike.add(json['list'][39]['main']['temp']);

    return WeatherModel(
      currentTemperature: json['list'][0]['main']['temp'],
        humidity: json['list'][0]['main']['humidity'],
        windSpeed: json['list'][0]['wind']['speed'],
        futureTemperatureList: futureTemperature,
        futureFeelsLikeList: feelsLike,
        description: json['list'][0]['weather'][0]['description'],
        dates: dateList,
        iconUrl: "http://openweathermap.org/img/w/" + json['list'][0]['weather'][0]['icon'] + '.png',
        images : images,
        weekly: weeklyTemperature
    );
  }

}

