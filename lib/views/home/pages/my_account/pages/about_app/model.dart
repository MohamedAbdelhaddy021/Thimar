class AboutData {
  late final AboutModel about;
  AboutData.fromJson(Map<String, dynamic> json){
    about = AboutModel.fromJson(json['data']);
  }
}

class AboutModel {

  late final String about;

  AboutModel.fromJson(Map<String, dynamic> json){
    about = json['about'];
  }

}