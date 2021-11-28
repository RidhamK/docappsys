import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);
  static const routeName = 'appointment';

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    final docId = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(docId as String),
      ),
    );
  }
}
