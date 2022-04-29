import 'package:flutter/material.dart';
import 'package:medorant/pages/first_screen.dart';

import '../api/google_signin_api.dart';
import '../utils/routes.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isLoggedIn = false;
    Future SignIn() async {
      final user = await GoogleSignInApi.login();
      if (user == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Sign In Failed")));
      } else {
        _isLoggedIn = true;
      }
      print(user);
      if (_isLoggedIn == true) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const FirstScreen()));
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 25),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 112, 111, 229)),
                      ),
                      // Text(
                      //   'to',
                      //   style: TextStyle(
                      //       fontSize: 18,
                      //       fontStyle: FontStyle.italic,
                      //       color: Colors.white),
                      // ),
                      const Text(
                        'Medorant',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 15, 15, 15)),
                      ),
                      Container(
                          height: 210,
                          child: Image.asset('assets/images/medsvg.png'))
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
                        // onPressed: () => Navigator.of(context)
                        //     .pushNamed(LoginScreen.routeName),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: Colors.indigo,
                        child: const Text(
                          'Log In',
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
    );
  }
}
