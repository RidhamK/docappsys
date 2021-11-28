import 'package:flutter/cupertino.dart';

class DoctorModel {
  String id;
  String? name;
  String? type;
  String? description;
  int? cost;
  String? image;
  String? slot;
  DoctorModel({
    required this.id,
    this.name,
    this.type,
    this.description,
    this.cost,
    this.image,
    this.slot,
  });
}

class Doctormodels with ChangeNotifier {
  List<DoctorModel> doc = [
    DoctorModel(
      id: '1',
      name: "Dr. David Kemp",
      type: "Heart Sergeon",
      cost: 20,
      description:
          "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",
      image: "assets/doctor.png",
    ),
    DoctorModel(
      id: '2',
      name: "Dr. katthy Mathews",
      type: "Neurology",
      cost: 20,
      description:
          "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",
      image: "assets/doctor_4.png",
    ),
    // {
    //   "name": "DR. Morris",
    //   "type": "Cardio Sergeon",
    //   "cost": 20,
    //   "description":
    //       "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",
    //   "image": "assets/doctor_3.png",
    // },
    // {
    //   "name": "Dr. Bruce Banner",
    //   "type": "Heart Sergeon",
    //   "cost": 20,
    //   "description":
    //       "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",
    //   "image": "assets/doctor_1.png",
    // }
  ];

  DoctorModel findBYId(String id) {
    return doc.firstWhere((prod) => prod.id == id);
  }
}
