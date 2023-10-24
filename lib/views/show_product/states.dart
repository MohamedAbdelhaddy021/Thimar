
import 'package:thimar/views/show_product/model.dart';

class ProductDetailsStates {}

class ProductGetSuccessState extends ProductDetailsStates {
  late final List<ProductModel> list;
  ProductGetSuccessState({required this.list});
}

class ProductGetLoadingState extends ProductDetailsStates {}

class ProductGetFailedState extends ProductDetailsStates {}
