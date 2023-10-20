import 'dart:io';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/auth/otp_code/states.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../create_new_password/view.dart';
import '../login/view.dart';

class OTPCubit extends Cubit<OTPStates>{
  OTPCubit():super(OTPStates());
  bool isClickable = true;
  bool isLoading = false;
  final countDownController = CountDownController();
  final codeController =TextEditingController();

  void verify(String phone) async{
    // isLoading = true;
    // setState(() {});
    emit(OTPLoadingState());
    final response = await DioHelper()
        .sendData("verify", data: {
      "code": codeController.text,
      "phone": phone,
      "type": Platform.operatingSystem,
      "device_token": "test"
    });
    if(response!.isSuccess){
      emit(OTPCorrectState());
      navigateTo(const LoginView());
    }else{
      navigateTo(const CreateNewPasswordView());
    }
    emit(OTPFailureState());
    // setState(() {});
  }

}