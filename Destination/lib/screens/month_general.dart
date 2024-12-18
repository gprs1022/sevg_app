import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MonthGeneral extends StatefulWidget {
  const MonthGeneral({Key? key}) : super(key: key);

  static const String routeName = '/month-general';


  @override
  State<MonthGeneral> createState() => _MonthGeneralState();
}

class _MonthGeneralState extends State<MonthGeneral> {

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

    var list = destinationData["General Master"] as List<dynamic>;

    setState(() {
      for(var element in list){
        if(element["Country"] == Name){
          data.add(element);
          return;
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

        title: Text("Months, "+Name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context , index){
                    return _Month_General_card(index);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }

  _Month_General_card(index){
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
        bottom: 10.0,
      ),
      child: Container(
        child: Column(
          children: [
            Center(child:Text("Jan :- " + data[index]["Good Time to Travel or Not (10 = High Season, 5 = Shoulder, 0 = low season)"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,), ) ,),
            Divider(),
            Center(child: Text("Feb :- " + data[index]["Column19"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),
            Divider(),
            Center(child: Text("Mar :- " + data[index]["Column20"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),
            Divider(),
            Center(child: Text("Apr :- " + data[index]["Column21"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),
            Divider(),
            Center(child: Text("May :- " + data[index]["Column22"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),
            Divider(),
            Center(child: Text("Jun :- " + data[index]["Column23"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),
            Divider(),
            Center(child: Text("Jul :- " + data[index]["Column24"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),
            Divider(),
            Center(child: Text("Aug :- " + data[index]["Column25"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),
            Divider(),
            Center(child: Text("Sep :- " + data[index]["Column26"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),
            Divider(),
            Center(child: Text("Oct :- " + data[index]["Column27"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),
            Divider(),
            Center(child: Text("Nov :- " + data[index]["Column28"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),
            Divider(),
            Center(child: Text("Dec :- " + data[index]["Column29"].toString(), style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize:20.0,),),),

          ],
        ),
      ),
    );
  }
}
