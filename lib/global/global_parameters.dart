import 'package:flutter/material.dart';
import 'package:flutter_navigator/pages/home.page.dart';
import 'package:flutter_navigator/pages/counter.page.dart';
import 'package:flutter_navigator/pages/contacts.page.dart';
import 'package:flutter_navigator/pages/login.page.dart';
import 'package:flutter_navigator/pages/meteo.page.dart';
import 'package:flutter_navigator/pages/gallery.page.dart';

class GlobalParameters {
  // ✅ This method fixes the "home()" call in main.dart
  static Widget home() => HomePage();

  static final routes = {
    "/": (context) => HomePage(),
    "/counter": (context) => CounterPage(),
    "/contacts": (context) => ContactsPage(),
    "/meteo": (context) => MeteoPage(),
    "/gallery": (context) => GalleryPage(),
    "/login": (context) => LoginPage(),
  };

  static final menus = [
    {
      "title": "Home",
      "route": "/",
      "icon": Icon(Icons.home, color: Colors.deepOrange),
    },
    {
      "title": "Counter",
      "route": "/counter",
      "icon": Icon(Icons.memory, color: Colors.deepOrange),
    },
    {
      "title": "Contacts",
      "route": "/contacts",
      "icon": Icon(Icons.contacts, color: Colors.deepOrange),
    },
    {
      "title": "Meteo",
      "route": "/meteo",
      "icon": Icon(Icons.wb_cloudy, color: Colors.deepOrange),
    },
    {
      "title": "Gallery",
      "route": "/gallery",
      "icon": Icon(Icons.photo, color: Colors.deepOrange),
    },
  ];
}
