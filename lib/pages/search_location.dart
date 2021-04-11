import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/weather_data.dart';
import 'package:geocoder/geocoder.dart';

class SearchLocation extends StatefulWidget {
  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  dynamic position = "";
  dynamic city = "";

  void getLocationLatLon(String city) async {
//    var addresses = await Geocoder.local.findAddressesFromQuery(city);
//    var first = addresses.first;
//    final position = first.coordinates;
//    print(position);

    WeatherData instance = WeatherData.c(city: city);
    await instance.getDataWithCity();
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
//    getLocationLatLon(city);
  }

  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/sky.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(32, 200.0, 32, 0),
        child: Column(
          children: <Widget>[
            //Text("Search Weather", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
            //Text("Instantly", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200, color: Colors.black),),
            SizedBox(height: 24,),
            TextFormField(
              controller: cityController,

              decoration: InputDecoration(

                prefixIcon: Icon(Icons.search, color: Colors.white70,),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ),

                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ),

                hintText: "City Name",
                hintStyle: TextStyle(color: Colors.white),

              ),
              style: TextStyle(color: Colors.white),

            ),

            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: (){
                  getLocationLatLon(cityController.text);
                },
                color: Colors.white,
                child: Text("Search", style: TextStyle(color: Colors.black54, fontSize: 16),),

              ),
            )

          ],
        ),
      ),
    );
  }
}
