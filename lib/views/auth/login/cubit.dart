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

  final formKey = GlobalKey<FormState>();
  bool isHidden = true;

  final phoneController = TextEditingController(text: "01288128523");
  final passwordController = TextEditingController(text: "123456789");

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final response = await DioHelper().sendData("login", data: {
        "phone": phoneController.text,
        "password": passwordController.text,
        "type": Platform.operatingSystem,
        "device_token": "test",
        "user_type": "client"
      });

      if (response!.isSuccess) {
        emit(LoginSuccessState());
        if(response.response!.data["message"]!=null){
          showMessage(response.message);
        }
        final model = UserData.fromJson(response.response!.data);
        await CacheHelper.saveUserDetail(model.model);
        navigateTo(const HomeView());
      } else {
        emit(LoginFailedState());
        showMessage(response.message);
      }
    }
  }
}
