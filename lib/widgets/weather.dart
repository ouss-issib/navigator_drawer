import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  final String city;
  Weather(this.city);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  List<dynamic>? weatherData;

  Future<void> getData(String url) async {
    try {
      final resp = await http.get(Uri.parse(url), headers: {'accept': 'application/json'});
      setState(() {
        weatherData = json.decode(resp.body)['list'];
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    String url =
        'https://api.openweathermap.org/data/2.5/forecast?q=${widget.city}&appid=cc818ab28a219ccd98c3607d542ecc62&units=metric';
    print(url);
    getData(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
        backgroundColor: Colors.blueAccent,

      ),
      body: weatherData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: weatherData!.length,
        itemBuilder: (context, index) {
          var weatherItem = weatherData![index];
          var weatherMain = weatherItem['weather'][0]['main'].toString().toLowerCase();
          int dt = weatherItem['dt']; // seconds since epoch

          // Convert seconds to DateTime
          DateTime date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);

          return Card(
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('images/$weatherMain.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              DateFormat('E dd/MM/yyyy').format(date),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${DateFormat('HH:mm').format(date)} | ${weatherItem['weather'][0]['main']}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${(weatherItem['main']['temp'] as num).round()} °C",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
