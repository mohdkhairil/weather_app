import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherData {
  double lat; // location name for UI
  double lon; //if use latitude longitude
  double temp;
  String city;
  String error;
  String icon;
  String weather;
  String desc;

  WeatherData({this.lat, this.lon});
  WeatherData.c({this.city});

  Future<void> getDataWithLatLong() async {
    try {
      // make the request
      Response response = await get(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=304ca827ce89d3028d4e33961fad0613');
      Map data = jsonDecode(response.body);

      // get properties from json
      Map tempObject = data['main'];
      List list = data['weather'];
      Map weatherObject = list[0];
      temp = tempObject['temp'] - 273.15;
      city = data['name'];
      icon = weatherObject['icon'];
      weather = weatherObject['main'];
      desc = weatherObject['description'];
      print(weatherObject);
      print(temp);
      print(city);
      print(icon);
      print(weather);
      print(desc);
    } catch (e) {
      print(e);
      error = 'Cannot get the weather data';
    }
  }

  Future<void> getDataWithCity() async {
    try {
      // make the request
      Response response = await get(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=304ca827ce89d3028d4e33961fad0613');
      Map data = jsonDecode(response.body);

      // get properties from json
      Map tempObject = data['main'];
      List list = data['weather'];
      Map weatherObject = list[0];
      temp = tempObject['temp'] - 273.15;
      city = data['name'];
      icon = weatherObject['icon'];
      weather = weatherObject['main'];
      desc = weatherObject['description'];
      print(weatherObject);
      print(temp);
      print(city);
      print(icon);
      print(weather);
      print(desc);
    } catch (e) {
      print(e);
      error = 'Cannot get the weather data';
    }
  }
}
