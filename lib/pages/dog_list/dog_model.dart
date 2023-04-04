import 'dart:convert';
import 'dart:ui';

class DogModel{
List<DogData>? data;

  DogModel({ this.data,});
DogModel.fromJSON(Map<String,dynamic> json){
if(json["data"]!=null){
  data = <DogData>[];
json["data"].forEach((element) { data!.add(DogData.fromJSON(element));});

}else{
  data=null;
}

}

}



class DogData{
  String ?name;
  String? breed;
  Color ? color;

  DogData({ this.name,  this.breed, this.color});
  DogData.fromJSON(Map<String,dynamic> json){
    this.name=json["name"];
    this. breed=json["breed"];
    this. color=Color(int.parse(json["color"]));
    // this. color=Color(0xffF0E345);
  }

}