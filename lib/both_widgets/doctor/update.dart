import 'package:flutter/material.dart';

class DoctorUpdateWidget extends StatefulWidget {
  const DoctorUpdateWidget({Key? key}) : super(key: key);

  @override
  Doctor_UpdateStateWidget createState() => Doctor_UpdateStateWidget();
}

class Doctor_UpdateStateWidget extends State<DoctorUpdateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text('From'), Text('To')],
        ),
        Text('No. of Patient'),
        Text('Cost'),
        Text('City'),
      ],
    );
  }
}
