import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/Weather.dart';
import 'package:weather/WeatherDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {

  final String WEATHER_KEY = "82ba6ea4483149d4b0792650240504";
  final Color COLOR_STD = Color(0xFF43A6C6);
  List<Weather> weather = [];

  TextEditingController ctrCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather",
      theme: ThemeData( scaffoldBackgroundColor: COLOR_STD,),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
          backgroundColor: COLOR_STD,
        ),
        body:
          Center(
            child:Column(
              children: [
              SizedBox(height: 25.0,width: 100.0,),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 50.0,
                  maxWidth: 200.0,
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'City',
                    hintText: 'Insert a city',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  controller: ctrCity,)
              ),
              ElevatedButton(
                  onPressed: (){getWeatherByCity();},
                  child: const Text("Search...")),
              Expanded(
                  child: ListView.builder(
                      itemCount: weather.length,
                      itemBuilder: (BuildContext context, int index){
                        return ListTile(
                          title: Text(weather[index].locality),
                          subtitle: Text(weather[index].description),
                          leading: Image.network(weather[index].icon!),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => WeatherDetail(weather: weather[index],))
                            );
                          },
                        );
                      }
                  )
              ),

              ],),
          ),
      )
    );
  }

  Future getWeatherByLocation() async {
    const dominio = 'http://api.weatherapi.com/v1';
    const path = '/current.json';
    Map<String, dynamic> parameters = {'key': WEATHER_KEY ,'q': "au to:ip"};
    Uri uri = Uri.parse(dominio+path).resolveUri(Uri(queryParameters: parameters));
    print(uri);
    http.get(uri).then((result) {
      final weathersData = json.decode(result.body);
      Weather weathers = Weather.fromJson(weathersData);
      print(weathers);
    });
  }

  Future getWeatherByCity() async {
    const dominio = 'http://api.weatherapi.com/v1';
    const path = '/forecast.json';
    Map<String, dynamic> parameters = {'key': WEATHER_KEY ,'q': ctrCity.text, 'days': "3"};
    Uri uri = Uri.parse(dominio+path).resolveUri(Uri(queryParameters: parameters));
    print(uri);
    http.get(uri).then((result) {

      final weathersData = json.decode(result.body);
      Weather weathers = Weather.fromJson(weathersData);
      setState(() {
        weather.add(weathers);
      });
      print(weathers);
    });
  }
}