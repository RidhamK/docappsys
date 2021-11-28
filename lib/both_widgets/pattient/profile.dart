import '/both_widgets/pattient/appointment.dart';
import '/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientProfileWidget extends StatefulWidget {
  const PatientProfileWidget({Key? key}) : super(key: key);

  @override
  _PatientProfileWidgetState createState() => _PatientProfileWidgetState();
}

class _PatientProfileWidgetState extends State<PatientProfileWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              height: height * .4,
              child: Center(child: Image.asset('assets/doctor.png')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Fname'),
                SizedBox(
                  width: 100,
                ),
                Text('Lname'),
              ],
            ),
            Text('Number'),
            Text('Email'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Gender'),
                Text('Age'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
