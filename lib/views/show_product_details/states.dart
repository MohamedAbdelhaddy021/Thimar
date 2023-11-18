




import '../../features/products/model.dart';

class ProductDetailsStates {}

class ProductGetSuccessState extends ProductDetailsStates {
  late final ProductModel model;
  ProductGetSuccessState( {required this.model,});
}

class ProductGetLoadingState extends ProductDetailsStates {}

class ProductGetFailedState extends ProductDetailsStates {}
