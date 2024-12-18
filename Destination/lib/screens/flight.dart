import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Flight extends StatefulWidget {
  const Flight({Key? key}) : super(key: key);

  static const String routeName = '/flight';


  @override
  State<Flight> createState() => _FlightState();
}

class _FlightState extends State<Flight> {

  var Name;
  List<dynamic> data = [];

  @override
  void initState(){
    super.initState();
    readJson();
  }

  @override
  void didChangeDependencies(){

    var destinationString = ModalRoute.of(context)?.settings.arguments as String;

    setState(() {
      Name = destinationString;
    });

    super.didChangeDependencies();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString(
        'asset/datacomplete.json');
    final destinationData = await json.decode(response);

    var list = destinationData["Flight"] as List<dynamic>;

    setState(() {
      for(var element in list){
        if(element["Country"] == Name){
          data.add(element);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff27293A),
      appBar: AppBar(
        // backgroundColor: Color(0XFFE4222E),
        backgroundColor: Color(0xff27293A),

        title: Text("Flights, "+Name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context , index){
                    return _Flight_card(index);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }

  _Flight_card(int index){
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
        bottom: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0,color: Color(0XFFEFA5AA)),

        ),
        child: Column(
          children: [
            Center(child: Text("City :- " + data[index]["City"],style: TextStyle(color: Colors.white , fontSize: 18.0),),),
            Divider(),
            Center(child: Text("Haul :- " + data[index]["Haul \n(Short Haul (upto 3 hrs), medium haul  (3-6 hrs), long haul(6-12 hrs))"],style: TextStyle(color: Colors.white , fontSize: 18.0),),),
            Divider(),
            Center(child: Text("Time from Delhi (HH:MM) :- " + data[index]["Time from Delhi\n(HH:MM)"],style: TextStyle(color: Colors.white , fontSize: 18.0),),),
            Divider(),
            Center(child: Text("Time from Mumbai (HH:MM) :- " + data[index]["Time from Mumbai (HH:MM)"],style: TextStyle(color: Colors.white , fontSize: 18.0),),),
            Divider(),
            Center(child: Text("Return Flight Cost from Delhi per person :- " + data[index]["Return Flight Cost from Delhi per person"].toString(),style: TextStyle(color: Colors.white , fontSize: 18.0),),),
          ],
        ),
      ),
    );
  }

}
