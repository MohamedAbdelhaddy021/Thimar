// class GetCitiesCityModel {
//   late final List<CityModel> list;
//   late final String status;
//   late final String message;
//
//   GetCitiesCityModel.fromJson(Map<String,dynamic> json) {
//     list = List.from(json['CityModel']).map((e) => CityModel.fromJson(e)).toList();
//     status = json['status'];
//     message = json['message'];
//   }
// }
//
// class CityModel {
//   late final String id, name;
//
//   CityModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
// }

class GetCitiesCityModel {
  late final List<CityModel> list;

  GetCitiesCityModel.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']).map((e)=>CityModel.fromJson(e)).toList();
  }

}

class CityModel {
  late final String id;
  late final String name;

  CityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }
}