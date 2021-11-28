import 'dart:math';

import '/both_widgets/pattient/appointment.dart';
import '/both_widgets/pattient/doctordetail.dart';
import '/model/doctor/doctormodel.dart';
import '/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientHomeWidget extends StatefulWidget {
  const PatientHomeWidget({Key? key}) : super(key: key);

  @override
  Patient_HomeStateWidget createState() => Patient_HomeStateWidget();
}

class Patient_HomeStateWidget extends State<PatientHomeWidget> {
  Color randomColor() {
    var random = Random();
    final colorList = [
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    final docDetialList = Provider.of<Doctormodels>(context).doc;
    return ListView.builder(
      itemCount: docDetialList.length,
      itemBuilder: (context, index) => Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                    DoctorDetailScreen.routeName,
                    arguments: docDetialList[index].id),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: randomColor(),
                      ),
                      child: Image.asset(
                        docDetialList[index].image!,
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: Text(docDetialList[index].name!),
                  subtitle: Wrap(
                    direction: Axis.vertical,
                    spacing: 5,
                    children: [
                      Text(docDetialList[index].type!),
                      Text('cost : ${docDetialList[index].cost!}'),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          Appointment.routeName,
                          arguments: docDetialList[index].id),
                      icon: Icon(
                        Icons.schedule,
                        color: randomColor(),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
