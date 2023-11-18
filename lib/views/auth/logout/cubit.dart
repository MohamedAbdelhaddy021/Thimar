import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/views/auth/login/view.dart';
import 'package:thimar/views/auth/logout/states.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit() : super(LogoutStates());

  Future<void> logout() async {
    final response = await DioHelper().sendData("logout",
        data: {"device_token": "test", "type": Platform.operatingSystem});
    if (response!.isSuccess) {
      await CacheHelper.clear();
      navigateTo(LoginView(), removeHistory: true);
      emit(LogoutSuccessState());
    } else {
      emit(LogoutFailedState());
      showMessage(response.message);
    }
  }
}
