
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/auth/reset_password/states.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../login/view.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordStates());
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  void resetPassword({required String phone,required String code}) async {
    if (formKey.currentState!.validate()) {
      emit(GetResetPasswordLoadingState());
      final response = await DioHelper().sendData(
        "reset_password",
        data: {
          "phone": phone,
          "code": code,
          "password": passwordController.text,
        },
      );
      if (response!.isSuccess) {
        // showMessage(response.message);
        navigateTo(const LoginView());
        emit(GetResetPasswordSuccessState());
      } else {
        emit(GetResetPasswordFailedState());
      }
    }
  }
}
