import 'package:flutter/material.dart';
import 'package:medorant/utils/themes.dart';

import '../widgets/disease_tag.dart';

class LoginDisease extends StatefulWidget {
  const LoginDisease({Key? key}) : super(key: key);

  @override
  State<LoginDisease> createState() => _LoginDiseaseState();
}

class _LoginDiseaseState extends State<LoginDisease> {
  final tags = <String>['Cancer', 'Periods'];
  final diseaseList = TextEditingController();

  void doSomething(value) {
    if (value == '') {
      null;
    } else {
      tags.add(value);
    }
    setState(() {});
    diseaseList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            children: [
              const SizedBox(
                height: 170,
              ),
              Text(
                'Do you Have a disease?',
                style: TextStyle(
                  color: AppTheme.lightTheme(context).primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Disease",
                  border: OutlineInputBorder(),
                ),
                controller: diseaseList,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username cant be Empty";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: doSomething,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                height: 164,
                width: double.infinity,
                child: SizedBox(
                  height: double.infinity,
                  child: Wrap(
                    children: tags.map((d) {
                      return Tags(d);
                    }).toList(),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 148, 114, 232),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 148, 114, 232))),
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
                width: double.infinity,
                height: 40,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
