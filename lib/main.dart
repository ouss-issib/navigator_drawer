import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_navigator/providers/auth_provider.dart';
import 'package:flutter_navigator/global/global_parameters.dart';
import 'package:flutter_navigator/pages/login.page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return MaterialApp(
      title: "Flutter Drawer App with Auth",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 22, color: Colors.deepOrange),
        ),
      ),
      initialRoute: auth.isLoggedIn ? "/" : "/login",
      routes: {
        ...GlobalParameters.routes,
        "/login": (context) => LoginPage(),
      },
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            Widget page = (auth.isLoggedIn)
                ? GlobalParameters.routes[settings.name]!(context)
                : (settings.name == "/login"
                ? LoginPage()
                : LoginPage()); // fallback to login if unauthorized

            return FadeTransition(opacity: animation, child: page);
          },
        );
      },
    );

  }
}
