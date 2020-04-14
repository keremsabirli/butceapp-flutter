import 'package:butceappflutter/screens/login_screen.dart';
import 'package:butceappflutter/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[800],
        accentColor: Colors.amber,
        appBarTheme: AppBarTheme(
          color: Colors.grey[800],
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.amber,
              fontSize: 22
            )
          )
        )
      ),
      initialRoute: '/login',
      routes: <String, WidgetBuilder> {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}