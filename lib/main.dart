import 'package:flutter/material.dart';
import 'package:medorant/pages/first_screen.dart';
import 'package:medorant/pages/home.dart';
import 'package:medorant/pages/login_screen.dart';
import 'package:medorant/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medorant',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 112, 111, 229),
        // accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: const LoginScreen(),
      routes: {
        AllRoutes.firstScreen: (context) => const FirstScreen(),
      },
    );
  }
}
