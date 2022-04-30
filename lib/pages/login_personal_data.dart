import 'package:flutter/material.dart';
import 'package:medorant/utils/themes.dart';
import './login_disease.dart';

class LoginEdit extends StatelessWidget {
  LoginEdit({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'Personal Details',
                  style: TextStyle(
                      color: AppTheme.lightTheme(context).primaryColor,
                      fontSize: 26),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/img1.jpg',
                  ),
                  radius: 50,
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username can't be Empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email can't be Empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: "Age",
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Age can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Gender",
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Gender can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppTheme.lightTheme(context).primaryColor)),
                            onPressed: () {
                              if (_formkey.currentState!.validate() == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginDisease()));
                              } else {
                                return;
                              }
                            },
                            child: const Text('Next'),
                          ),
                          width: double.infinity,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
