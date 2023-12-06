import '../../../../features/products/model.dart';

class FavoritesData {
  late final List<ProductModel> list;
  FavoritesData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']).map((e)=>ProductModel.fromJson(e)).toList();
  }

}