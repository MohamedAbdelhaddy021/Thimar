
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/cities/bloc/states.dart';
import 'package:thimar/features/cities/cities.dart';

import '../../../core/logic/dio_helper.dart';

class CitiesCubit extends Cubit<CitiesStates>{
  CitiesCubit():super(CitiesStates());

  void getData() async {
    emit(CitiesLoadingState());
    final response = await DioHelper().getData("cities/1");
    if(response!.isSuccess){
      final model =GetCitiesCityModel.fromJson(response.response!.data);
      emit(CitiesSuccessState(list: model.list));
    }else{
      emit(CitiesFailedState());
    }
  }

}