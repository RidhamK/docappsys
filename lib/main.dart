import 'package:docappsys/both_widgets/pattient/appointment.dart';
import 'package:docappsys/both_widgets/pattient/doctordetail.dart';
import 'package:docappsys/model/doctor/doctormodel.dart';
import 'package:docappsys/model/patientmodel.dart';
import 'package:docappsys/provider/patient_auth.dart';
import 'package:docappsys/screens/dochomepage.dart';
import 'package:docappsys/screens/loginpage.dart';
import 'package:docappsys/screens/mid_screen.dart';
import 'package:docappsys/screens/patienthomepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/doc_auth.dart';
import 'screens/doc_auth_screen.dart';
import '/screens/spalsh_screen.dart';
import './provider/cart.dart';
import './provider/order.dart';
import './screens/cart_screen.dart';
import './screens/order_screen.dart';
import 'screens/slot_detail_screen.dart';
import 'screens/edit_slot_screen.dart';

import 'screens/slot_screen_overview.dart';
import './screens/user_product_screen.dart';

import 'provider/slots.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DocAuth(),
        ),
        ChangeNotifierProxyProvider<DocAuth, Slots>(
          create: (ctx) => Slots(null, null, []),
          update: (ctx, auth, previousSlots) => Slots(
            auth.token,
            auth.userId,
            previousSlots == null ? [] : previousSlots.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PatientAuth(),
        ),
        ChangeNotifierProxyProvider<PatientAuth, Slots>(
          create: (ctx) => Slots(null, null, []),
          update: (ctx, auth, previousSlots) => Slots(
            auth.token,
            auth.userId,
            previousSlots == null ? [] : previousSlots.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Doctormodels(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatientData(),
        ),
        ChangeNotifierProxyProvider<PatientAuth, Order>(
          create: (ctx) => Order(null, null, []),
          update: (ctx, auth, previousOrder) => Order(
            auth.token,
            auth.userId,
            previousOrder == null ? [] : previousOrder.orders,
          ),
        ),
      ],
      child:
          // Consumer<Auth>(
          //   builder: (ctx, auth, _) =>
          MaterialApp(
        title: 'Shopping',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            // ignore: deprecated_member_use
            accentColor: Colors.white),
        // home: const ProductOverview(),
        home: LoginPage(),
        // : auth.isAuth
        //     ? LoginPage()
        //     : FutureBuilder(
        //         future: auth.tryAutoLogin(),
        //         builder: (context, snapshot) =>
        //             snapshot.connectionState == ConnectionState.waiting
        //                 ? SplashScreen()
        //                 : LoginPage(),
        //       ),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrderScreen.routeName: (ctx) => const OrderScreen(),
          UserProduct.routeName: (ctx) => const UserProduct(),
          EditSlot.routeName: (ctx) => const EditSlot(),
          DocHomePage.routeName: (ctx) => DocHomePage(),
          DoctorDetailScreen.routeName: (ctx) => DoctorDetailScreen(),
          Appointment.routeName: (ctx) => Appointment(),
          PatientHomePage.routeName: (ctx) => PatientHomePage(),
          MidScreen.routename: (ctx) => MidScreen(),
          // PatientMidScreen.routename: (ctx) => PatientMidScreen(),
          // AuthScreen.routeName: (ctx) => AuthScreen(),
        },
      ),
      // ),
    );
  }
}
