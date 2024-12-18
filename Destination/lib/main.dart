import 'package:destination/screens/destination_detail.dart';
import 'package:destination/screens/destination_list.dart';
import 'package:destination/screens/month_general.dart';
import 'package:flutter/material.dart';

import 'screens/Month.dart';
import 'screens/city_master.dart';
import 'screens/flight.dart';
import 'screens/package_detail.dart';
import 'screens/visa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const destination_List_Screen(),
      routes: {
        destination_List_Screen.routeName: (context) => destination_List_Screen(),
        destination_detail.routeName : (context) => destination_detail(),
        Cities.routeName : (context) => Cities(),
        PackageDetail.routeName : (context) => PackageDetail(),
        Visa.routeName : (context) => Visa(),
        Flight.routeName : (context) => Flight(),
        Month.routeName : (context) => Month(),
        MonthGeneral.routeName : (context) => MonthGeneral(),
      },
    );
  }
}
