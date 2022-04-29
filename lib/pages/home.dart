import 'package:flutter/material.dart';
import 'package:medorant/utils/themes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(context),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/img1.jpg'),
                radius: 30,
              ),
              title: Text(
                'Welcome Back 👋',
                style: TextStyle(
                    color: AppTheme.lightTheme(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              subtitle: const Text('Roshan Kumar'),
              trailing: const Text('224'),
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Medorant',
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: AppTheme.lightTheme(context).primaryColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'A simple yet powerful mobile app that tells you which \n Medicine is counterfeit for you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 120, 120, 120),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/Search.png')
          ],
        ),
      ),
    );
  }
}
