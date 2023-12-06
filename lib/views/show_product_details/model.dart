import '../../features/products/model.dart';

class ProductDetailsData {
  late final ProductModel model;

  ProductDetailsData.fromJson(Map<String, dynamic> json) {
    model = ProductModel.fromJson(json['data']);
  }
}

