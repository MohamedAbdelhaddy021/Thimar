

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/category/states.dart';

import '../../../core/logic/dio_helper.dart';
import '../../features/products/model.dart';

class CategoryCubit extends Cubit<CategoryStates>{
  CategoryCubit():super(CategoryStates());

  Future<void> getData({required int id}) async {
    emit(CategoryLoadingState());
    final response = await DioHelper().getData("categories/$id");
    if(response!.isSuccess){
      final model =ProductsData.fromJson(response.response!.data);
      emit(CategorySuccessState(list: model.model));
    }else
    {
      emit(CategoryFailedState(msg: response.message));
    }
  }
}