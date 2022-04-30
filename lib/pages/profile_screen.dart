import 'package:flutter/material.dart';
import 'package:medorant/widgets/drawer.dart';

import '../utils/themes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        drawer: AppDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
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
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Edit'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Details',
              style: TextStyle(
                  color: AppTheme.lightTheme(context).primaryColor,
                  fontSize: 28),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 164, 203, 234),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 164, 203, 234),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
