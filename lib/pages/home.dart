import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String icon = data['icon'];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/sky.jpg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    if (result != null) {
                      setState(() {
                        data = {
                          'temp': result['temp'],
                          'city': result['city'],
                          'lat': result['lat'],
                          'lon': result['lon'],
                          'icon': result['icon'],
                          'desc': result['desc'],
                          'weather': result['weather'],
                        };
                      });
                    }
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  label: Text(
                    'Search Other Location',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 90,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Card(
                      elevation: 0,
                        color: Colors.transparent,
                        child: Image.network('http://openweathermap.org/img/wn/$icon@4x.png'),
                      shape: new RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white,width: 5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['city'].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(data['weather'],
                    style: TextStyle(fontSize: 30.0, color: Colors.white)),
                SizedBox(height: 20.0),
                Text('Description: '+data['desc'],
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
                SizedBox(height: 20.0),
                Text(data['temp'].toStringAsFixed(2)+"\u2103",
                    style: TextStyle(fontSize: 50.0, color: Colors.white)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
