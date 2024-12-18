import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cities extends StatefulWidget {
  const Cities({Key? key}) : super(key: key);

  static const String routeName = '/city-master';


  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {

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

    var list = destinationData["City Master"] as List<dynamic>;

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

        title: Text("Cities, "+Name),
      ),
      body: Column(
        children: [
      Expanded(
        child: Center(
          child: ListView.builder(
          itemCount: data.length,
            itemBuilder: (BuildContext context , index){
              return _City_card(index);
            }
          ),
        ),
      ),
        ],
      ),
    );
  }

  _City_card(int index){
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
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                // color: Colors.greenAccent
              ),
              child: Center(child: Text(data[index]["City"] , style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,))),
            ),
            Container(
              width: double.maxFinite,
              child: Text(data[index]["City Sightseeing Options"],style: TextStyle(color: Colors.white, fontSize: 18.0 ),),
            ),
          ],
        ),
      ),
    );
  }
}
