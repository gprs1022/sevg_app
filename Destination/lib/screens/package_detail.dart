import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PackageDetail extends StatefulWidget {
  static const String routeName = '/package-detail';
  const PackageDetail({Key? key}) : super(key: key);

  @override
  State<PackageDetail> createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {

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

    var list = destinationData["Package Details"] as List<dynamic>;

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
        title: Text("Package Detail of "+Name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context , index){
                    return _package_card(index);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
  _package_card(index){
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
            Center(child: Text("Duration of Package (No. of nights) :- "+data[index]["Duration of Package (No. of nights)"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0,),)),
            Divider(),
            Center(child: Text("Cities Covered :- "+data[index]["Cities Covered"],style: TextStyle(color: Colors.white,fontSize: 18.0,),)),
            Divider(),
            Center(child: Text("Return Flight Cost per persion :- "+data[index]["Return Flight Cost per persion"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0,),)),
            Divider(),
            Center(child: Text("Starting Package Cost for 2\n(including Flight, visa, insurance) :- "+data[index]["Starting Package Cost for 2\n(including Flight, visa, insurance)"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0,),)),
            Divider(),
            Center(child: Text("Starting Package Cost for 2 (Without Flight) :- "+data[index]["Starting Package Cost for 2 (Without Flight)"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0,),)),
            Divider(),
            Center(child: Text("Avg Cost for 2 persons per night with 3 star hotels :- "+data[index]["Avg Cost for 2 persons per night with 3 star hotels"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0,),)),
            Divider(),
            Center(child: Text("Avg Cost for 2 persons per night with 4 star hotels :- "+data[index]["Avg Cost for 2 persons per night with 4 star hotels"].toString(),style: TextStyle(color: Colors.white,fontSize: 18.0,),)),
            Divider(),
          ],
        ),
      ),
    );
  }
}
