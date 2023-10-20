
import '../model.dart';

class ProductStates{}

class ProductLoadingState extends ProductStates{}
class ProductFailedState extends ProductStates{
  final String msg;

  ProductFailedState({required this.msg});
}
class ProductSuccessState extends ProductStates{
  final List<ProductModel> list;

  ProductSuccessState({required this.list});
}