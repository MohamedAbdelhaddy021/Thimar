import 'package:thimar/features/products/model.dart';


class FavoriteStates {}

class GetFavoriteSuccessState extends FavoriteStates {
   final List<ProductModel> list;
  GetFavoriteSuccessState( {required this.list});
}

class GetFavoriteLoadingState extends FavoriteStates {}

class GetFavoriteFailedState extends FavoriteStates {}

class AddToFavoriteSuccessState extends FavoriteStates {
}

class AddToFavoriteLoadingState extends FavoriteStates {}

class AddToFavoriteFailedState extends FavoriteStates {}

class RemoveItemSuccessState extends FavoriteStates {}

class RemoveItemFailedState extends  FavoriteStates {}

class RemoveItemLoadingState extends FavoriteStates {}
