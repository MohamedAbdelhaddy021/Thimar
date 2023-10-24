import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/views/show_product/model.dart';
import 'package:thimar/views/show_product/states.dart';
import 'package:thimar/views/show_product/view.dart';


class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsStates());
  // final int id ;
  Future<void> getDetails() async{
    emit(ProductGetLoadingState());
    final response = await DioHelper().getData("categories/1");
    if (response!.isSuccess){
      final model =ProductsData.fromJson(response.response!.data);
      navigateTo(ProductDetailsView(model: model.list[2]));
      emit(ProductGetSuccessState(list: model.list));
    }else {
      emit(ProductGetFailedState());
    }
  }
}
