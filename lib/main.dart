import 'package:flutter/material.dart';
import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/search_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => SearchLocation(),
    },
  ));
}
