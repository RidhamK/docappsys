import 'package:docappsys/screens/mid_screen.dart';

import '/Screens/dochomepage.dart';
import '/Screens/patienthomepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 200,
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(MidScreen.routename, arguments: 'doctor'),
                child: const Card(
                  child: Center(
                    child: Text('Doctors Login'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(MidScreen.routename, arguments: 'patient'),
                child: Card(
                  child: Center(child: Text('Patients Login')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
