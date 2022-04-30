import 'package:flutter/material.dart';
import 'package:medorant/pages/home.dart';

import '../api/google_signin_api.dart';
import 'login_personal_data.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isLoggedIn = false;

    // ignore: non_constant_identifier_names
    Future SignIn() async {
      final user = await GoogleSignInApi.login();
      List<String> data = [
        user!.id,
        user.email,
        user.displayName.toString(),
        user.photoUrl.toString()
      ];
      if (user == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Sign In Failed")));
      } else {
        _isLoggedIn = true;
      }

      if (_isLoggedIn == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Home(),
            settings: RouteSettings(arguments: user.id),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginEdit(),
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login bg.png'),
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 50),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 112, 111, 229)),
                        ),
                        const Text(
                          'Medorant',
                          style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 15, 15, 15)),
                        ),
                        const SizedBox(height: 170),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox(height: 60)),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: double.infinity,
                        padding:
                            const EdgeInsets.only(top: 25, left: 24, right: 24),
                        child: RaisedButton(
                          onPressed: SignIn,
                          elevation: 0,
                          color: Colors.indigo,
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
