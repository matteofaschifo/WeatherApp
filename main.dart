import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }

/*Future getWeatherByIp() async {
    const dominio = 'www.googleapis.com';
    const path = '/books/v1/volumes';
    Map<String, dynamic> parametri = {'q': "auto:ip"};
    Uri uri = Uri.https(dominio, path, parametri);
    print(uri);
    http.get(uri).then((result) {

      final booksData = json.decode(result.body);
      final bookDataItem = booksData['items'];
      List<Book> books = bookDataItem.map<Book>((json) => Book.fromJson(json)).toList();
      setState(() {
        this.books = books;
      });
    });
  }
  Future getWeatherByCity() async {
    const dominio = 'http://api.weatherapi.com/v1';
    const path = '/current.json';
    Map<String, dynamic> parametri = {'key': WEATHER_KEY ,'q': ctrCity.text, 'days': ctrDasy.Text};
    Uri uri = Uri.https(dominio, path, parametri);
    print(uri);
    http.get(uri).then((result) {

      final booksData = json.decode(result.body);
      final bookDataItem = booksData['items'];
      List<Book> books = bookDataItem.map<Book>((json) => Book.fromJson(json)).toList();
      setState(() {
        this.books = books;
      });
    });
  }*/
}