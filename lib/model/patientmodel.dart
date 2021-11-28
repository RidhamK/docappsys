import 'package:flutter/cupertino.dart';

class Patient {
  String id;
  String name;
  String dob;
  String number;
  String email;
  String gender;

  Patient({
    required this.id,
    required this.name,
    required this.dob,
    required this.number,
    required this.email,
    required this.gender,
  });
}

class PatientData with ChangeNotifier {
  List a = <Patient>[
    Patient(
        id: 'id',
        name: 'Ridham',
        dob: 'dob',
        number: '8849842561',
        email: 'ridham2244@gmail.com',
        gender: 'male'),
  ];
}
