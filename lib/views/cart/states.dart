
import 'package:thimar/views/cart/model.dart';

class CartStates {}

//get_from_cart
class GetCartItemsSuccessState extends CartStates {
  final CartData model;

  GetCartItemsSuccessState({required this.model});
}
class GetCartItemsFailedState extends CartStates {}
class GetCartItemsLoadingState extends CartStates {}

//add_to_cart
class AddToCartSuccessState extends CartStates {}
class AddToCartFailedState extends CartStates {}
class AddToCartLoadingState extends CartStates {}

//remove_from_cart
class RemoveItemSuccessState extends CartStates {}
class RemoveItemFailedState extends CartStates {}
class RemoveItemLoadingState extends CartStates {}
