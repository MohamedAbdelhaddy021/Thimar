import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/products/bloc/states.dart';
import 'package:thimar/features/products/model.dart';

import '../../../core/logic/dio_helper.dart';

class ProductCubit extends Cubit<ProductStates>{
  ProductCubit():super(ProductStates());

  Future<void> getData() async {
    emit(ProductLoadingState());
    final response = await DioHelper().getData("products");
    if(response!.isSuccess){
      final model =ProductsData.fromJson(response.response!.data);
      emit(ProductSuccessState(list: model.model));
    }else
    {
      emit(ProductFailedState(msg: response.message));
    }
  }
}