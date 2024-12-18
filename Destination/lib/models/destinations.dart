import 'dart:ffi';

class Destination{
  String Country;
  bool Beach;
  bool Mountain;
  // bool Culture;
  // bool HoneyMoon;
  bool City;
  bool Wildlife;
  bool Jan;
  bool Feb;
  bool Mar;
  bool Apr;
  bool May;
  bool Jun;
  bool Jul;
  bool Aug;
  bool Sep;
  bool Oct;
  bool Nov;
  bool Dec;
  String Visa;
  String FlightTime;
  int Price;
  int PriceWf;
  int Duration;



  Destination({this.Country = "",this.Beach = false,this.Mountain = false,
    // this.Culture = false,this.HoneyMoon=false,
    this.City = false, this.Wildlife = false,
    this.Jan = false , this.Feb = false,this.Mar = false,this.Apr = false,this.May = false,this.Jun = false,this.Jul = false,this.Aug = false,
    this.Sep = false,this.Oct = false,this.Nov = false,this.Dec = false,this.Visa = "",this.FlightTime = "",
    this.Price = 0,this.PriceWf = 0,this.Duration = 0,
  });



  factory Destination.fromJson(Map<String,dynamic> json){
    return Destination(
      Country: (json['Country'] != null)? json['Country'] : "",
      Beach: (json["Beach"] == "Yes")? true : false,
      Mountain: (json["Mountain"] == "Yes")? true : false,
      // Culture: (json["Culture \/ History"] == "Yes")? true : false,
      // HoneyMoon: (json["Honeymoon"] == "Yes")? true : false,
      City: (json["City"] == "Yes")? true:false,
      Wildlife:(json["Wildlife"] == "Yes")?true:false,
      Jan: (json["Good Time to Travel or Not (10 = High Season, 5 = Shoulder, 0 = low season)"] != 0)? true:false,
      Feb: (json["Column19"] != 0)? true : false,
      Mar: (json["Column20"] != 0)? true : false,
      Apr: (json["Column21"] != 0)? true : false,
      May: (json["Column22"] != 0)? true : false,
      Jun: (json["Column23"] != 0)? true : false,
      Jul: (json["Column24"] != 0)? true : false,
      Aug: (json["Column25"] != 0)? true : false,
      Sep: (json["Column26"] != 0)? true : false,
      Oct: (json["Column27"] != 0)? true : false,
      Nov: (json["Column28"] != 0)? true : false,
      Dec: (json["Column29"] != 0)? true : false,
      Visa: (json["Visa Type \n(Not required, evisa, offline visa, schengen visa, On Arrival)"] != null)?json["Visa Type \n(Not required, evisa, offline visa, schengen visa, On Arrival)"]:"",
      FlightTime: (json["Flight Duration (HH:MM)"] != null)?json["Flight Duration (HH:MM)"]:"",
      Price: (json["Starting Package Cost for 2\n(including Flight, visa, insurance)"] != null)?json["Starting Package Cost for 2\n(including Flight, visa, insurance)"]:0,
      PriceWf: (json["Starting Package Cost for 2 (Without Flight)"] != null)?json["Starting Package Cost for 2 (Without Flight)"]:0,
      Duration: (json["Duration of Package (No. of nights)"] != null)?json["Duration of Package (No. of nights)"]:0,
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String , dynamic> data = new Map<String , dynamic>();
    data['Country'] = this.Country;
    return data;
  }
}