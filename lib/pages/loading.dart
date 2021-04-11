import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/weather_data.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  dynamic position = "";

  void getCurrentLocation() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    WeatherData instance = WeatherData(lat: position.latitude, lon: position.longitude);
    await instance.getDataWithLatLong();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'temp': instance.temp,
      'lat': instance.lat,
      'lon': instance.lon,
      'city': instance.city,
      'weather': instance.weather,
      'icon': instance.icon,
      'desc': instance.desc
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/sky.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
                children: <Widget> [
                  Text('Fetching weather data...',style: TextStyle(fontSize: 30.0, color: Colors.white)),
                  SizedBox(height: 22,),
                  SpinKitRing(
                  color: Colors.white,
                  size: 50.0,
                ),

            ]),
          ),
        )
    );
  }
}
