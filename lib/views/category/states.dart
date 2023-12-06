




import 'package:thimar/features/products/model.dart';
import 'package:thimar/views/category/model.dart';

class CategoryStates{}

class CategoryLoadingState extends CategoryStates{}
class CategoryFailedState extends CategoryStates{
  final String msg;

  CategoryFailedState({required this.msg});
}
class CategorySuccessState extends CategoryStates{
  final List<ProductModel> list;

  CategorySuccessState({required this.list});
}