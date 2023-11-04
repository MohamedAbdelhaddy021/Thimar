import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/views/auth/forget_password/states.dart';
import 'package:thimar/views/auth/otp_code/view.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordStates());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  void forgetPassword() async {
    if (formKey.currentState!.validate()) {
      final response = await DioHelper().sendData(
        "forget_password",
        data: {"phone": phoneController.text},
      );
      if (response!.isSuccess) {
        emit(ForgetPassLoadingState());
        navigateTo(
            OtpCodeView(isActiveAccount: false, phone: phoneController.text),
            removeHistory: true);
        phoneController.clear();
        emit(ForgetPassSuccessState());
      } else {
        emit(ForgetPassFailedState());
      }
    }
  }
}
