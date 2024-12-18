import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Month extends StatefulWidget {
  const Month({Key? key}) : super(key: key);

  static const String routeName = '/month';

  @override
  State<Month> createState() => _MonthState();
}

class _MonthState extends State<Month> {

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

    var list = destinationData["Month"] as List<dynamic>;

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

        title: Text("Months, "+Name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context , index){
                    return _Month_card(index);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }

  _Month_card(index){
    return Container(
      child: Column(
        children: [
          if(data[index]["Column1"] == "Jan")
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 30.0,
              ),
              child: Center(child: Text(data[index]["City"] , style: TextStyle(color:Color(0xffdf678c),fontSize: 20.0,fontWeight: FontWeight.bold ,),),),
            ),
          Text(data[index]["Column1"] + "   Rating :- "+ data[index]["Good Time to Travel or Not (10 = High Season, 5 = Shoulder, 0 = low season)"].toString() +"   Weather :- "+data[index]["Weather in this month"] ,style: TextStyle(color: Colors.white,fontSize: 18.0),),
          Divider(),
          Text("      min Temp :- "+ data[index]["Temp (min)"].toString() + "   max Temp :- "+ data[index]["Temp (max)"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0),),
          Divider(),
          if(data[index]["Additional Comments"] != null)
            Text("      additional comments :- " +data[index]["Additional Comments"],style: TextStyle(color: Colors.white,fontSize: 18.0),),
          Divider(),
        ],
      ),
    );
  }
}
