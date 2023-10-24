import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/auth/login/states.dart';
import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import 'model.dart';
import '../../home/view.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());

  final loginFormKey = GlobalKey<FormState>();
  bool isHidden = true;

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final response = await DioHelper().sendData("login", data: {
        "phone": phoneController.text,
        "password": passwordController.text,
        "type": Platform.operatingSystem,
        "device_token": "test",
        "user_type": "client"
      });

      if (response!.isSuccess) {
        if(response.response!.data["message"]==""){
          debugPrint(response.message);
          // showMessage(response.message);
        }
        final model = UserData.fromJson(response.response!.data);
        await CacheHelper.saveUserDetail(model.model);
        navigateTo(const HomeView());
        emit(LoginSuccessState());
      } else {
        // showMessage(response.message);
        emit(LoginFailedState());
      }
    }
  }
}
