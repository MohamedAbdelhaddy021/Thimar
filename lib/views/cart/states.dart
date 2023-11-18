import 'model.dart';

class CartStates {}

class GetCartItemsSuccessState extends CartStates {
  final List<CartModel> list;

  GetCartItemsSuccessState({required this.list});
}

class GetCartItemsFailedState extends CartStates {}

class GetCartItemsLoadingState extends CartStates {}

class AddToCartSuccessState extends CartStates {}

class AddToCartFailedState extends CartStates {}

class AddToCartLoadingState extends CartStates {}
