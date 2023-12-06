import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/views/home/pages/my_account/pages/about_app/model.dart';
import 'package:thimar/views/home/pages/my_account/pages/about_app/states.dart';

class AboutCubit extends Cubit<AboutStates>{
  AboutCubit():super(AboutStates());
  void getData () async {
    final response =await DioHelper().getData("about");

    if(response!.isSuccess){
      final model =AboutData.fromJson(response.response!.data);
      emit(AboutSuccessState(about: model.about));
    }else {
      emit(AboutFailedState());
    }
  }
}