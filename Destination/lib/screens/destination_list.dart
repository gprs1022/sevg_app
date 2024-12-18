import 'dart:ui';
import 'package:destination/models/checkbox_state.dart';
import 'package:destination/models/destinations.dart';
import 'package:destination/screens/destination_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class destination_List_Screen extends StatefulWidget {
  const destination_List_Screen({Key? key}) : super(key: key);

  static const String routeName = '/destination-name';

  @override
  State<destination_List_Screen> createState() => _destination_List_ScreenState();
}

class _destination_List_ScreenState extends State<destination_List_Screen> {

  // for application of filter
  bool filmonth = false;
  bool filview = false;
  bool filvisa = false;
  bool filTime = false;
  bool filPrice = false;
  bool filPriceWF = false;
  bool filDuration = false;


  // for visibility in filter page
  bool visFilter = false;
  bool visFButton = true;
  bool visDes = true;
  bool visFilter0 = true;
  bool visFilter1 = false;
  bool visFilter2 = false;
  bool visFilter3 = false;
  bool visFilter4 = false;
  bool visFilter5 = false;
  bool visFilter6 = false;
  bool visFilter7 = false;


  String Heading = "Destination";


  final allneed = CheckBoxState(title: "All");
  final need = [
    CheckBoxState(title: "Beach"),
    CheckBoxState(title: "Mountain"),
    // CheckBoxState(title: "Culture \/ History"),
    // CheckBoxState(title: "Honeymoon"),
    CheckBoxState(title: "City"),
    CheckBoxState(title: "Wildlife"),
  ];

  final Allmonth = CheckBoxState(title: "All");
  final month = [
    CheckBoxState(title: "Jan"),
    CheckBoxState(title: "Feb"),
    CheckBoxState(title: "Mar"),
    CheckBoxState(title: "Apr"),
    CheckBoxState(title: "May"),
    CheckBoxState(title: "Jun"),
    CheckBoxState(title: "Jul"),
    CheckBoxState(title: "Aug"),
    CheckBoxState(title: "Sep"),
    CheckBoxState(title: "Oct"),
    CheckBoxState(title: "Nov"),
    CheckBoxState(title: "Dec"),

  ];


  final visa = [
    CheckBoxState(title: "Not Required"),
    CheckBoxState(title: "evisa"),
    CheckBoxState(title: "offline visa"),
    CheckBoxState(title: "schengen visa"),
    CheckBoxState(title: "On Arrival"),
  ];

  final flightTime = [
    CheckBoxState(title: "Less then 3 hrs"),
    CheckBoxState(title: "3-6 hrs"),
    CheckBoxState(title: "Above 6 hrs"),
  ];
  
  final price = [
    CheckBoxState(title: "Less then 50k"),
    CheckBoxState(title: "50k - 1Lac"),
    CheckBoxState(title: "1Lac - 1.5Lac"),
    CheckBoxState(title: "1.5Lac - 2Lac"),
    // CheckBoxState(title: "Above 2Lac"),
    CheckBoxState(title: "2Lac - 3Lac"),
    CheckBoxState(title: "3Lac - 4Lac"),
    CheckBoxState(title: "4Lac - 5Lac"),
    CheckBoxState(title: "above 5Lac"),
  ];

  final pricewf = [
    CheckBoxState(title: "Less then 50k"),
    CheckBoxState(title: "50k - 1Lac"),
    CheckBoxState(title: "1Lac - 1.5Lac"),
    CheckBoxState(title: "1.5Lac - 2Lac"),
    // CheckBoxState(title: "Above 2Lac"),
    CheckBoxState(title: "2Lac - 3Lac"),
    CheckBoxState(title: "3Lac - 4Lac"),
    CheckBoxState(title: "4Lac - 5Lac"),
    CheckBoxState(title: "above 5Lac"),
  ];
  
  final duration=[
    CheckBoxState(title: "Less then 4 days"),
    CheckBoxState(title: "4 days"),
    CheckBoxState(title: "5 days"),
    CheckBoxState(title: "6 days"),
    CheckBoxState(title: "More then 6 days"),
  ];
  
  
  List<Destination> destinations = [];
  List<Destination> newDestinations = [];


  void initState(){
    super.initState();
    readJson();
}

  Future<void> readJson() async {
    final String response = await rootBundle.loadString(
        'asset/datacomplete.json');
    final destinationData = await json.decode(response);

    var list = destinationData["General Master"] as List<dynamic>;

    setState(() {
      // destinations.clear();
      destinations = list.map((e) => Destination.fromJson(e)).toList();
      var prev = null;
      for(var e in destinations){
        if(e.Country != "" && e.Country != prev){
          newDestinations.add(e);
          prev = e.Country;
        }
      }
      // newDestinations.addAll(destinations);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff27293A),
      appBar: AppBar(
        // backgroundColor: Color(0XFFE4222E),
        backgroundColor: Color(0xff27293A),

        title: Text(Heading),
        // flexibleSpace: Container(
        //   child: Center(child: Text("Destinations")),

          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.bottomLeft,
          //     end: Alignment.topRight,
          //     colors: <Color>[
          //       Color(0XFFB9C3FF),
          //       Color(0XFFECD4FC)
          //     ],
          //   ),
          // ),
        // ),
      ),
      body: Stack(
        children: [
          Column(
          children: [

            // buildGroupCheckbox(allneed),
            // Divider(),
            // ...need.map(buildSingleCheckbox).toList(),
            //
            //
            //
            // Center(
            //   child: ElevatedButton(
            //       onPressed: readJson,
            //       child: Text("search")
            //   ),
            // ),
            // _filterItem(),
            //
            // if(destinations.length > 0)
            //   Expanded(
            //     child: ListView.builder(
            //       itemCount: newDestinations.length,
            //       itemBuilder: (BuildContext context, index) {
            //         return Card(
            //           color: Colors.greenAccent,
            //           child: ListTile(
            //             title: Text(newDestinations[index].Country),
            //
            //             onTap: () {
            //               Navigator.of(context).pushNamed(
            //                   destination_detail.routeName, arguments: jsonEncode(
            //                   newDestinations[index]));
            //             },
            //           ),
            //         );
            //       },
            //     ),
            //   )
            // else
            //   Text(""),
            Expanded(
              child: ListView.builder(
                itemCount: newDestinations.length + 1,
                  itemBuilder: (BuildContext context , index){
                  return (index == 0) ? _filterItem() : _listItem(index-1);
                  }
              ),
            )
          ],
        ),
          Visibility(
            visible: visFButton,
            child: Positioned(
              bottom: 15.0,
              right: 15.0,
              child: FloatingActionButton(
                onPressed: visController,
                backgroundColor: Color(0xffFF5988),
                child: const Icon(Icons.format_list_bulleted),
              ),
            ),
          ),
        ]
      ),
    );
  }

  _filterItem(){
    return Visibility(
      visible: visFilter,
      child: Column(
        children: [

          // all the buttons i.e page 1
          Visibility(
            visible: visFilter0,
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
                    onPressed:(){
                      setState(() {
                        visFilter0 = !visFilter0;
                        visFilter1 = !visFilter1;
                        Heading = "Choose Month...";
                      });
                    } ,
                    child: Text("Month",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
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
                    onPressed:(){
                      setState(() {
                        visFilter0 = !visFilter0;
                        visFilter2 = !visFilter2;
                        Heading = "Choose View...";
                      });
                    } ,
                    child: Text("View",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
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
                    onPressed:(){
                      setState(() {
                        visFilter0 = !visFilter0;
                        visFilter3 = !visFilter3;
                        Heading = "Choose Visa...";
                      });
                    } ,
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
                    onPressed:(){
                      setState(() {
                        visFilter0 = !visFilter0;
                        visFilter4 = !visFilter4;
                        Heading = "Choose Flight Time...";
                      });
                    } ,
                    child: Text("Flight Time",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
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
                    onPressed:(){
                      setState(() {
                        visFilter0 = !visFilter0;
                        visFilter5 = !visFilter5;
                        Heading = "Choose Price...";
                      });
                    } ,
                    child: Text("Price",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
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
                    onPressed:(){
                      setState(() {
                        visFilter0 = !visFilter0;
                        visFilter6 = !visFilter6;
                        Heading = "Choose Price...";
                      });
                    } ,
                    child: Text("Price without Flight",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
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
                    onPressed:(){
                      setState(() {
                        visFilter0 = !visFilter0;
                        visFilter7 = !visFilter7;
                        Heading = "Choose Duration...";
                      });
                    } ,
                    child: Text("Duration",style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 18.0),),
                  ),
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF55A0FF)),
                  ),
                  onPressed: (){
                    // filterNeed();
                    choosenDestination();
                    visController();
                  },
                  child: Text("Apply Filter"),
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0XFFcc252c)),
                  ),
                  onPressed: (){
                    // filterNeed();
                    // choosenDestination();
                    reset();
                    visController();
                  },
                  child: Text("Reset"),
                ),
              ],
            ),
          ),


          // per-filter section
          Visibility(
            visible: visFilter1,
            child: Column(
              children: [
                buildGroupCheckboxMonth(Allmonth),
                Divider(),
                ...month.map(buildSingleCheckboxMonth).toList(),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF55A0FF)),
                    ),
                    onPressed:(){
                      setState(() {
                        visFilter1 = !visFilter1;
                        visFilter0 = !visFilter0;
                        Heading = "Choose filter...";
                        filmonth = true;
                      });

                    } ,
                    child: Text("Apply"),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: visFilter2,
            child: Column(
              children: [
                // buildGroupCheckbox(allneed),
                // Divider(),
                ...need.map(buildSingleCheckbox).toList(),

                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF55A0FF)),
                      ),
                      onPressed:(){
                        setState(() {
                          visFilter0 = !visFilter0;
                          visFilter2 = !visFilter2;
                          Heading = "Choose filter...";
                          filview = true;
                        });
                      },
                      child: Text("Apply")
                  ),
                )
              ],
            ),
          ),

    Visibility(
    visible: visFilter3,
    child: Column(
    children: [
    ...visa.map(buildSingleCheckbox).toList(),
    Center(
    child: ElevatedButton(
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF55A0FF)),
    ),
    onPressed:(){
    setState(() {
    visFilter0 = !visFilter0;
    visFilter3 = !visFilter3;
    Heading = "Choose filter...";
    filvisa = true;
    });
    },
    child: Text("Apply")
    ),
    ),

        ],
      ),
    ),

          Visibility(
            visible: visFilter4,
            child: Column(
              children: [
                ...flightTime.map(buildSingleCheckbox).toList(),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF55A0FF)),
                      ),
                      onPressed:(){
                        setState(() {
                          visFilter0 = !visFilter0;
                          visFilter4 = !visFilter4;
                          Heading = "Choose filter...";
                          filTime = true;
                        });
                      },
                      child: Text("Apply")
                  ),
                ),

              ],
            ),
          ),

          Visibility(
            visible: visFilter5,
            child: Column(
              children: [
                ...price.map(buildSingleCheckbox).toList(),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF55A0FF)),
                      ),
                      onPressed:(){
                        setState(() {
                          visFilter0 = !visFilter0;
                          visFilter5 = !visFilter5;
                          Heading = "Choose filter...";
                          filPrice = true;
                        });
                      },
                      child: Text("Apply")
                  ),
                ),

              ],
            ),
          ),

          Visibility(
            visible: visFilter6,
            child: Column(
              children: [
                ...pricewf.map(buildSingleCheckbox).toList(),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF55A0FF)),
                      ),
                      onPressed:(){
                        setState(() {
                          visFilter0 = !visFilter0;
                          visFilter6 = !visFilter6;
                          Heading = "Choose filter...";
                          filPriceWF = true;
                        });
                      },
                      child: Text("Apply")
                  ),
                ),

              ],
            ),
          ),


          Visibility(
            visible: visFilter7,
            child: Column(
              children: [
                ...duration.map(buildSingleCheckbox).toList(),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF55A0FF)),
                      ),
                      onPressed:(){
                        setState(() {
                          visFilter0 = !visFilter0;
                          visFilter7 = !visFilter7;
                          Heading = "Choose filter...";
                          filDuration = true;
                        });
                      },
                      child: Text("Apply")
                  ),
                ),

              ],
            ),
          ),
        ],
      )
    );
  }

  _listItem(index){
    return Visibility(
      visible: visDes,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          // color: Color(0XFFEFA5AA),
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          gradient: LinearGradient(
            colors: [Color(0xff53C0FF),Color(0xff5843E6)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),

        child: ListTile(
          title: Center(child:Text(newDestinations[index].Country , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0 , color: Colors.white),),),
          onTap: () {
            Navigator.of(context).pushNamed(
                destination_detail.routeName, arguments: jsonEncode(
                newDestinations[index]));
          },
        ),


      ),
    );
  }


  Widget buildSingleCheckbox(CheckBoxState checkbox) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Color(0XFF55A0FF),
        checkColor: Colors.white,
        value: checkbox.value,
        title: Text(checkbox.title,style: TextStyle(color: Colors.white , fontSize: 16.0 ,fontWeight: FontWeight.bold),),
        onChanged: (value) =>
            setState(() {
              checkbox.value = value!;
              // allneed.value = need.every((element) => element.value);
            }),
      );

  Widget buildSingleCheckboxMonth(CheckBoxState checkbox) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox.value,
        title: Text(checkbox.title,style: TextStyle(color: Colors.white , fontSize: 16.0 ,fontWeight: FontWeight.bold),),
        onChanged: (value) =>
            setState(() {
              checkbox.value = value!;
              // Allmonth.value = month.every((element) => element.value);
            }),
      );



  // Widget buildGroupCheckbox(CheckBoxState checkbox) =>
  //     CheckboxListTile(
  //       controlAffinity: ListTileControlAffinity.leading,
  //       value: checkbox.value,
  //       title: Text(checkbox.title),
  //       onChanged:toggleGroupCheckboxNeed,
  //     );
  //
  // void toggleGroupCheckboxNeed(bool? value){
  //   if(value == null) return;
  //
  //   setState(() {
  //     allneed.value = value;
  //     need.forEach((element) => element.value = value);
  //   });
  // }

  Widget buildGroupCheckboxMonth(CheckBoxState checkbox) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox.value,
        title: Text(checkbox.title,style: TextStyle(color: Colors.white , fontSize: 16.0 ,fontWeight: FontWeight.bold),),
        onChanged:toggleGroupCheckboxMonth,
      );

  void toggleGroupCheckboxMonth(bool? value){
    if(value == null) return ;
    setState(() {
      Allmonth.value = value;
      month.forEach(((element) => element.value = value));
    });
  }
  
  // void filterNeed(){
  //   var arr = [need[0].value,need[1].value,need[2].value,need[3].value];
  //   var arrM = [month[0].value,month[1].value,month[2].value,month[3].value,month[4].value,month[5].value,month[6].value,month[7].value,month[8].value,month[9].value,month[10].value,month[11].value];
  //
  //   // List<Destination> newDestinations = [];
  //   this.newDestinations.clear();
  //
  //   for (var element in destinations) {
  //     // print("loop ran");
  //     var has = [element.Beach,element.Mountain,element.Culture,element.HoneyMoon];
  //     bool remain = false;
  //     for(int j = 0 ; j < arr.length ; j++ ){
  //       if(arr[j] == true){
  //         remain = remain || has[j] ;
  //       }
  //       if(remain == true) {
  //         // this.newDestinations.add(element);
  //         bool remainM = false;
  //         var hasM = [element.Jan,element.Feb,element.Mar,element.Apr,element.May,element.Jun,element.Jul,element.Aug,element.Sep,element.Oct,element.Nov,element.Dec];
  //         for(int k = 0 ; k < hasM.length ; k++){
  //           if(arrM[k] == true){
  //             remainM = remainM || hasM[k];
  //           }
  //           if(remainM == true){
  //             this.newDestinations.add(element);
  //             break;
  //           }
  //         }
  //         break;
  //       }
  //     }
  //   }
  //   setState(() {
  //     this.newDestinations;
  //   });
  // }

  void choosenDestination(){

    this.newDestinations.clear();

    var arr1 = [month[0].value,month[1].value,month[2].value,month[3].value,month[4].value,month[5].value,month[6].value,month[7].value,month[8].value,month[9].value,month[10].value,month[11].value];
    bool t1 = false;

    var arr2 = [need[0].value,need[1].value,need[2].value,need[3].value];
    bool t2 = false;

    var arr3 = [visa[0].value,visa[1].value,visa[2].value,visa[3].value,visa[4].value];
    bool t3 = false;

    var arr4 = [flightTime[0].value,flightTime[1].value,flightTime[2].value];
    bool t4 = false;

    var arr5 = [price[0].value , price[1].value , price[2].value , price[3].value ,price[4].value,price[5].value,price[6].value,price[7].value];
    bool t5 = false;

    var arr6 = [pricewf[0].value , pricewf[1].value , pricewf[2].value , pricewf[3].value ,pricewf[4].value,pricewf[5].value,pricewf[6].value,pricewf[7].value];
    bool t6 = false;

    var arr7 = [duration[0].value , duration[1].value , duration[2].value, duration[3].value, duration[4].value];
    bool t7 = false;


    for(bool e in arr1){
      if(e){
        t1 = true;
        this.filmonth = true;
        break;
      }
    }
    if(!t1) this.filmonth = false ;

    for(bool e in arr2){
      if(e){
        t2 = true;
        this.filview = true;
        break;
      }
    }
    if(!t2) this.filview = false ;

    for(bool e in arr3){
      if(e){
        t3 = true;
        this.filvisa = true;
        break;
      }
    }
    if(!t3) this.filvisa = false ;

    for(bool e in arr4){
      if(e){
        t4 = true;
        this.filTime = true;
        break;
      }
    }
    if(!t4) this.filTime = false ;

    for(bool e in arr5){
      if(e){
        t5 = true;
        this.filPrice = true;
        break;
      }
    }
    if(!t5) this.filPrice = false ;

    for(bool e in arr6){
      if(e){
        t6 = true;
        this.filPriceWF = true;
        break;
      }
    }
    if(!t6) this.filPriceWF = false ;

    for(bool e in arr7){
      if(e){
        t7 = true;
        this.filDuration = true;
        break;
      }
    }
    if(!t7) this.filDuration = false ;


    // no filters
    // if(!this.filmonth && !this.filview && !this.filvisa && !this.filTime){
    //   this.newDestinations.addAll(this.destinations);
    // }

    //filters
    List<bool> ans = [];
    for(int i = 0 ; i < this.destinations.length ; i++){
      ans.add(true);
    }

    if(this.filmonth){
      for(int i = 0 ; i < this.destinations.length ; i++){
        var element = this.destinations[i];
        var has1 = [element.Jan,element.Feb,element.Mar,element.Apr,element.May,element.Jun,element.Jul,element.Aug,element.Sep,element.Oct,element.Nov,element.Dec];
        if(ans[i]){
          bool req1 = false;
          for(int j = 0 ; j < arr1.length ; j ++){
            if(arr1[j]){
              req1 = req1 || has1[j];
            }
            if(req1) break;
          }
          if(!req1){
            ans[i] = false;
          }
        }
      }
    }

    if(this.filview){
      for(int i = 0 ; i < this.destinations.length ; i++){
        var element = this.destinations[i];
        var has2 = [element.Beach,element.Mountain,element.City,element.Wildlife];
        if(ans[i]){
          bool req2 = false;
          for(int j = 0 ; j < arr2.length ; j ++){
            if(arr2[j]){
              req2 = req2 || has2[j];
            }
            if(req2) break;
          }
          if(!req2){
            ans[i] = false;
          }
        }
      }
    }

    if(this.filvisa){
      for(int i= 0 ; i < this.destinations.length ; i++){
        var element = this.destinations[i];
        String has3 = element.Visa;
        if(ans[i]){
          if(has3 == "Not Required" && arr3[0] != true){
            ans[i] = false;
          }
          if(has3 == "Schengen visa" && arr3[3] != true){
            ans[i] = false;
          }
          if(has3 == "Offline visa" && arr3[2] != true){
            ans[i] = false;
          }
          if(has3 == "E Visa" && arr3[1] != true) {
            ans[i] = false;
          }
          if(has3 == "On Arrival" && arr3[4] != true){
            ans[i] = false;
          }
        }
      }
    }

    if(this.filTime){
      for(int i = 0 ; i < this.destinations.length ; i++){
        var element = destinations[i];
        String has4 = element.FlightTime;
        int has_4 = (has4.length > 0)?int.parse(has4.substring(0,has4.indexOf(":"))):0;
        if(ans[i]){
          bool req4 = false;
          if(arr4[0] && has_4 < 3){
            req4 = true;
          }
          if(arr4[1] && has_4 >= 3 && has_4 < 6 ){
            req4 = true;
          }
          if(arr4[2] && has_4 >= 6){
            req4 = true;
          }
          if(!req4){
            ans[i] = false;
          }
        }
      }
    }

    if(filPrice){
      for(int i = 0 ; i < this.destinations.length ; i++){
        var element = destinations[i];
        int has5 = element.Price;
        if(ans[i]){
          bool req5 = false;
          if(arr5[0] && has5 < 50000){
            req5 = true;
          }
          if(arr5[1] && has5 >= 50000 && has5 <=  100000){
            req5 = true;
          }
          if(arr5[2] && has5 >= 100000 && has5 <= 150000 ){
            req5 = true;
          }
          if(arr5[3] && has5 >= 150000 && has5 <= 200000){
            req5 = true;
          }
          if(arr5[4] && has5 >= 200000 && has5 <=300000){
            req5 = true;
          }

          if(arr5[5] && has5 >= 300000 && has5 <=400000){
            req5 = true;
          }

          if(arr5[6] && has5 >= 400000 && has5 <=500000){
            req5 = true;
          }

          if(arr5[7] && has5 >= 500000){
            req5 = true;
          }
          if(!req5){
            ans[i] = false;
          }
        }
      }
    }

    if(filPriceWF){
      for(int i = 0 ; i < this.destinations.length ; i++){
        var element = destinations[i];
        int has6 = element.PriceWf;
        if(ans[i]){
          bool req6 = false;
          if(arr6[0] && has6 < 50000){
            req6 = true;
          }
          if(arr6[1] && has6 >= 50000 && has6 <=  100000){
            req6 = true;
          }
          if(arr6[2] && has6 >= 100000 && has6 <= 150000 ){
            req6 = true;
          }
          if(arr6[3] && has6 >= 150000 && has6 <= 200000){
            req6 = true;
          }
          if(arr6[4] && has6 >= 200000 && has6 <= 300000){
            req6 = true;
          }
          if(arr6[5] && has6 >= 300000 && has6 <= 400000){
            req6 = true;
          }
          if(arr6[6] && has6 >= 400000 && has6 <= 500000){
            req6 = true;
          }
          if(arr6[7] && has6 >= 500000){
            req6 = true;
          }
          if(!req6){
            ans[i] = false;
          }
        }
      }
    }

    if(filDuration){
      for(int i = 0 ; i < destinations.length ; i++){
        var element = destinations[i];
        int has7 = element.Duration;
        if(ans[i]){
          bool req7 = false;
          if(arr7[0] && has7 < 4){
            req7 = true;
          }
          if(arr7[1] && has7 == 4){
            req7 = true;
          }
          if(arr7[2] && has7 == 5){
            req7 = true;
          }
          if(arr7[3] && has7 == 6){
            req7 = true;
          }
          if(arr7[4] && has7 > 6){
            req7 = true;
          }
          if(!req7){
            ans[i] = false;
          }
        }
      }
    }

    setState(() {
      var prev = null;
      for(int i = 0 ; i < ans.length ; i ++){
        if(ans[i] && this.destinations[i].Country != prev && this.destinations[i].Country != "") {
          this.newDestinations.add(this.destinations[i]);
          prev = this.destinations[i].Country;
        }
      }
    });

  }

  void visController(){

    setState(() {
      visFButton = !visFButton;
      visDes = !visDes;
      visFilter = !visFilter;

      Heading = (Heading == "Destination")?"Choose Filter..." : "Destination";
    });

  }

  void reset(){
      for(var e in month){
        e.value = false;
      }
      for(var e in need){
        e.value = false;
      }
      for(var e in visa){
        e.value = false;
      }
      for(var e in flightTime){
        e.value = false;
      }
      for(var e in price){
        e.value = false;
      }
      for(var e in pricewf){
        e.value = false;
      }
      for(var e in duration){
        e.value = false;
      }
      this.newDestinations.clear();

      setState(() {
        var prev = null;
        for(var e in destinations){
          if(e.Country != "" && e.Country != prev){
            newDestinations.add(e);
            prev = e.Country;
          }
        }
      });
  }
}
