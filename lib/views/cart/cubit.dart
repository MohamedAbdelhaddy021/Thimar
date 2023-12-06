import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_button.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/views/cart/states.dart';

import 'model.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartStates());

  Future<void> addToCart({required int id, required int amount}) async {
    emit(AddToCartLoadingState());
    final response = await DioHelper().sendData("client/cart", data: {
      "product_id": id,
      "amount": amount,
    });
    if (response!.isSuccess) {
      emit(AddToCartSuccessState());
    } else {
      emit(AddToCartFailedState());
    }
  }

  Future<void> getCartItems() async {

    emit(GetCartItemsLoadingState());
    final response = await DioHelper().getData('client/cart');
    if (response!.isSuccess) {
      final model = CartData.fromJson(response.response!.data);
      emit(GetCartItemsSuccessState(model: model));
    } else {
      emit(GetCartItemsFailedState());
    }
  }

  Future<void> deleteFromCart({required int id}) async {
   emit(RemoveItemLoadingState());
    final response = await DioHelper()
        .sendData("client/cart/delete_item/$id",  data: {
          '_method':'delete'
    });
    if (response!.isSuccess) {
      showMessage(response.message);
      emit(RemoveItemSuccessState());
      getCartItems();
    } else {
      showMessage(response.message);
      emit(RemoveItemFailedState());
    }
  }
}
