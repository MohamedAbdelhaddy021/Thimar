import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/slider/bloc/states.dart';

import '../../../core/logic/dio_helper.dart';
import '../model.dart';

class SliderCubit extends Cubit<SliderStates>{
  SliderCubit():super(SliderStates());
  Future<void> getData() async {
    emit(SliderLoadingState());
    final response = await DioHelper().getData("sliders");
    if(response!.isSuccess){
      final model =SliderData.fromJson(response.response!.data);
      emit(SliderSuccessState(list: model.list));
    }else
    {
      emit(SliderFailedState(msg: response.message));
    }
  }

}