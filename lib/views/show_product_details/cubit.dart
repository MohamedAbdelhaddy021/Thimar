
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/views/show_product_details/states.dart';

import 'model.dart';



class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsStates());
  Future<void> getDetails(int id) async{
    emit(ProductGetLoadingState());
    final response = await DioHelper().getData("products/$id");
    if (response!.isSuccess){
      final model =ProductDetailsData.fromJson(response.response!.data);
      emit(ProductGetSuccessState(model: model.model));
    }else {
      emit(ProductGetFailedState());
    }
  }
}
