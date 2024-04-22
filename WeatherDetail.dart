import 'package:flutter/material.dart';
import 'package:weather/Weather.dart';
import 'package:weather/WeatherDetail.dart';

class WeatherDetail extends StatelessWidget {
  WeatherDetail({super.key, required this.weather});

  final Color COLOR_STD = Color(0xFF2e88bf);

  Weather weather;

  double _rainfall = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather", style: TextStyle(color: Colors.white),),
        backgroundColor: COLOR_STD,
      ),
      body:Center(
        child: Column(
          children: [
            Text(weather.locality+", "+weather.country,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
            ),
            Text(weather.localTime,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white60
              )
            ),
            Row(children: [
              SizedBox(
                width: 62.0,
                height: 62.0,
                child: Image.network(weather.icon),
              ),
              SizedBox(width: 25.0, height: 10.0,),
              Text(weather.description,
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                )
              )
              ],
            ),
            Row(children: [
              SizedBox(
                width: 62.0,
                height: 62.0,
                child: Image.network('https://cdn2.iconfinder.com/data/icons/weather-color-2/500/weather-21-512.png'),
              ),
              SizedBox(width: 25.0, height: 10.0,),
              Text(weather.temperature.toString()+'° C',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )
              )
            ],
            ),
            Row(children: [
              SizedBox(
                width: 62.0,
                height: 62.0,
                child: Image.network('https://cdn2.iconfinder.com/data/icons/weather-color-2/500/weather-26-512.png '),
              ),
              SizedBox(width: 25.0, height: 10.0,),
              Text(weather.wind.toString()+' km/h',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )
              )
            ],
            ),
            Row(children: [
              SizedBox(
                width: 62.0,
                height: 62.0,
                child: Image.network('https://cdn0.iconfinder.com/data/icons/green-sustainability/96/water_drop-512.png'),
              ),
              SizedBox(width: 25.0, height: 10.0,),
              Text(weather.humidity.toString()+'%',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )
              )
            ],
            ),
            Row(children: [
              SizedBox(
                width: 62.0,
                height: 62.0,
                child: Image.network('https://cdn0.iconfinder.com/data/icons/good-weather-1/96/weather_icons-19-512.png'),
              ),
              SizedBox(width: 25.0, height: 10.0,),
              Text(weather.rainfall.toString()+' mm',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )
              )
            ],
            ),
          ],
        ),
      ),
      //Image.network('https://cdn2.iconfinder.com/data/icons/weather-color-2/500/weather-21-512.png'),
      backgroundColor: COLOR_STD,
    );
  }
}