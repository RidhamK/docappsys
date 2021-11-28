import 'package:flutter/material.dart';

class DoctorAppointmentWidget extends StatefulWidget {
  const DoctorAppointmentWidget({Key? key}) : super(key: key);

  @override
  Doctor_AppointmentStateWidget createState() =>
      Doctor_AppointmentStateWidget();
}

class Doctor_AppointmentStateWidget extends State<DoctorAppointmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Date'),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 5,
            itemBuilder: (context, index) => Card(
              child: Center(
                child: Text('todays slot'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
