import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/views/home/pages/favs/states.dart';

import 'model.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(FavoriteStates());

  Future<void> addToFavorite(int id) async {
    emit(AddToFavoriteLoadingState());
    final response =
        await DioHelper().sendData("client/products/$id/add_to_favorite");
    if (response!.isSuccess) {
      showMessage(response.message);
      emit(AddToFavoriteSuccessState());
    } else {
      emit(AddToFavoriteFailedState());
    }
  }

  Future<void> getFavorites() async {
    emit(GetFavoriteLoadingState());
    final response = await DioHelper().getData("client/products/favorites");
    if (response!.isSuccess) {
      final model = FavoritesData.fromJson(response.response!.data);
      emit(GetFavoriteSuccessState(list: model.list));
    } else {
      emit(GetFavoriteFailedState());
    }
  }

  Future<void> removeItem({required int id}) async {
    emit(RemoveItemLoadingState());
    final response = await DioHelper().sendData(
        "client/products/$id/remove_from_favorite",
        );
    if (response!.isSuccess) {
      showMessage(response.message);
      getFavorites();
      emit(RemoveItemSuccessState());
    } else {
      emit(RemoveItemFailedState());
    }
  }
}
