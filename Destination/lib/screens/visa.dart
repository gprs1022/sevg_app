import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Visa extends StatefulWidget {
  const Visa({Key? key}) : super(key: key);

  static const String routeName = '/visa';


  @override
  State<Visa> createState() => _VisaState();
}

class _VisaState extends State<Visa> {

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

    var list = destinationData["Visa"] as List<dynamic>;

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

        title: Text("Visa, "+Name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context , index){
                    return _Visa_card(index);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }

  _Visa_card(int index){
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0,color: Color(0XFFEFA5AA)),

        ),
        child: Column(
          children: [
            Center(child: Text("Visa Type :- " + data[index]["Visa Type \n(Not required, evisa, offline visa, schengen visa, On Arrival)"],style: TextStyle(color: Colors.white,fontSize: 18.0),),),
            Divider(),
            Center(child: Text("Minimum Processing time :- " + data[index]["Minimum Processing time"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0),),),
            Divider(),
            Center(child: Text("Price of minimum duration Tourist Visa :- " + data[index]["Price of minimum duration Tourist Visa"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0),),),
            Divider(),
            // Center(child: Text("Maximum No of days visa granted :- " + data[index]["Maximum No of days visa granted"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0),),),
            // Divider(),
            // Center(child: Text("Price of minimum duration Tourist Visa :- " + data[index]["Price of minimum duration Tourist Visa"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0),),),
            // Divider(),
            Center(child: Text("Need to vist Visa Centre :- " + data[index]["Need to vist Visa Centre"],style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),),
            Divider(),
            Center(child: Text("Comment if have UK Visa :- " + ((data[index]["Comment if have UK Visa"] != null)?data[index]["Comment if have UK Visa"]:"-"),style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),),
            Divider(),
            Center(child: Text("Comment if have US visa :- " + ((data[index]["Comment if have US Visa"] != null)?data[index]["Comment if have US Visa"]:"-"),style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),),
            Divider(),
            Center(child: Text("Comment if have Schengen Visa :- " +((data[index]["Comment if have Schengen Visa"] != null)?data[index]["Comment if have Schengen Visa"]:"-") ,style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),),

          ],
        ),
      ),
    );
  }

}
