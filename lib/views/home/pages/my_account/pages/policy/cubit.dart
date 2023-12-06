import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/views/home/pages/my_account/pages/policy/model.dart';
import 'package:thimar/views/home/pages/my_account/pages/policy/states.dart';

class PolicyCubit extends Cubit<PolicyStates>{
  PolicyCubit():super(PolicyStates());
  void getData() async {
    final response =await DioHelper().getData("policy");
    if(response!.isSuccess){
      final model =PolicyData.fromJson(response.response!.data);
      emit(GetPolicySuccessState(policy: model.data));
    }else {
      emit(GetPolicyFailedState());
    }
  }
}