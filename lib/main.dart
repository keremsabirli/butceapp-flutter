import 'package:butceappflutter/screens/expense_add_screen.dart';
import 'package:butceappflutter/screens/home_screen.dart';
import 'package:butceappflutter/screens/login_screen.dart';
import 'package:butceappflutter/screens/member_add_screen.dart';
import 'package:butceappflutter/screens/profile_screen.dart';
import 'package:butceappflutter/screens/report_screen.dart';
import 'package:butceappflutter/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.grey[900],
          textTheme: TextTheme(
            headline: TextStyle(
              color: Colors.white,
              fontSize: 22
            )
          )
        )
      ),
      initialRoute: '/login',
      routes: <String, WidgetBuilder> {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/homepage': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/members/add': (context) => MemberAddScreen(),
        '/expense/add': (context) => ExpenseAddScreen(),
        '/report': (context) => ReportScreen(),
      },
    );
  }
}