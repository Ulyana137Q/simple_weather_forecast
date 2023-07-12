import 'dart:convert';

import 'package:http/http.dart' as http;

import 'homePage.dart';

class Weather {
  final String time;
  final double temp;
  final String wheatherStatus;
  final String location;
  final String icon;
  const Weather(this.temp, this.wheatherStatus, this.location, this.time, this.icon);

}

class Searcher {

  static const APIKey = 'eb7c4e622e094ff8a31115742232606';

  static Future<Weather> search(String location) async{
    String url = 'http://api.weatherapi.com/v1/current.json?key='+APIKey+'&q='+location+'&aqi=no';
    var searchResult = await http.get(Uri.parse(url));
    var result = json.decode(searchResult.body)['current'];
    // print(result);
    if(searchResult.statusCode == 200){
      weather = Weather(result['temp_c'], result['condition']['text'], location,
          result['last_updated'], result['condition']['icon']);//.replaceFirst('//cdn.weatherapi.com/weather/64x64',''));
      return Weather(result['temp_c'], result['condition']['text'], location,
          result['last_updated'], result['condition']['icon']);//.replaceFirst('//cdn.weatherapi.com/weather/64x64',''));
    }
    else {
      return Weather(-273, 'wheatherStatus', 'location', 'time', '/day/113.png');
    }
  }
}