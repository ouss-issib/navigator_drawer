import 'package:flutter/material.dart';
import 'package:flutter_navigator/widgets/my_drawer.dart';
import 'package:flutter_navigator/widgets/weather-form.dart';

class MeteoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(), // keep the app's drawer
      body: WeatherForm(), // use your custom form
    );
  }
}
