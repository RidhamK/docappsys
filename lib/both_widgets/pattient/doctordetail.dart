import '/both_widgets/pattient/appointment.dart';

import '/model/doctor/doctormodel.dart';
import '/theme/colors.dart';
import '/theme/extention.dart';
import '/theme/text_styles.dart';
import '/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDetailScreen extends StatefulWidget {
  const DoctorDetailScreen({Key? key}) : super(key: key);
  static const routeName = 'doctordetailscreen';

  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }
    double height = MediaQuery.of(context).size.height;
    final docId = ModalRoute.of(context)!.settings.arguments;
    final docDetails =
        Provider.of<Doctormodels>(context).findBYId(docId as String);
    Widget _appbar() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BackButton(
            color: Theme.of(context).primaryColor,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: LightColor.extraLightBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(docDetails.image!),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) => Container(
                height: height * .5,
                padding: const EdgeInsets.only(
                  left: 19,
                  right: 19,
                  top: 16,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            Text(
                              docDetails.name!,
                              style: titleStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.check_circle,
                              size: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                            const Spacer(),
                          ],
                        ),
                        subtitle: Text(
                          docDetails.type!,
                        ),
                      ),
                      const Divider(
                        thickness: .3,
                        color: LightColor.grey,
                      ),
                      Text(
                        'Charge : ${docDetails.cost!.toString()}',
                        style: titleStyle,
                      ),
                      Text("About", style: titleStyle).vP16,
                      Text(
                        docDetails.description!,
                        style: TextStyles.body.subTitleColor,
                      ),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pushNamed(
                              Appointment.routeName,
                              arguments: docId),
                          child: Text("Make an appointment",
                              style: TextStyles.titleNormal.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _appbar(),
          ],
        ),
      ),
    );
  }
}
