import 'dart:convert';
import 'dart:ui';
import 'package:destination/models/destinations.dart';
import 'package:destination/screens/package_detail.dart';
import 'package:flutter/material.dart';

import 'Month.dart';
import 'city_master.dart';
import 'flight.dart';
import 'month_general.dart';
import 'visa.dart';

class destination_detail extends StatefulWidget {
  const destination_detail({Key? key}) : super(key: key);

  static const String routeName = '/destination-detail';

  @override
  State<destination_detail> createState() => _destination_detailState();
}

class _destination_detailState extends State<destination_detail> {

  var destiantionName ;
  Destination? destiantion ;

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies(){

    var destinationString = ModalRoute.of(context)?.settings.arguments as String;

    var destinationjson = jsonDecode(destinationString);

    setState(() {
      destiantion = Destination.fromJson(destinationjson);
      destiantionName = destiantion?.Country;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff27293A),
      appBar: AppBar(
        title: Text(destiantionName),
        backgroundColor: Color(0xff27293A),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFF5988)),
                    minimumSize: MaterialStateProperty.all(Size(300.0, 55.0)),
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(
                        Cities.routeName, arguments: destiantionName);
                  },
                  child: Text("Cities",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFF5988)),
                    minimumSize: MaterialStateProperty.all(Size(300.0, 55.0)),
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(
                        MonthGeneral.routeName, arguments: destiantionName);
                  },
                  child: Text("Months - General",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFF5988)),
                    minimumSize: MaterialStateProperty.all(Size(300.0, 55.0)),
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(
                        Month.routeName, arguments: destiantionName);
                  },
                  child: Text("Months - Cities",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFF5988)),
                    minimumSize: MaterialStateProperty.all(Size(300.0, 55.0)),
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(
                        PackageDetail.routeName, arguments: destiantionName);
                  },
                  child: Text("Package Detail", style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFF5988)),
                    minimumSize: MaterialStateProperty.all(Size(300.0, 55.0)),
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(
                        Visa.routeName, arguments: destiantionName);
                  },
                  child: Text("Visa",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFF5988)),
                    minimumSize: MaterialStateProperty.all(Size(300.0, 55.0)),
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(
                        Flight.routeName, arguments: destiantionName);
                  },
                  child: Text("Flight",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
