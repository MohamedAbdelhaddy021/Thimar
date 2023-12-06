import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/views/home/pages/my_account/pages/contact_us/states.dart';

class ContactUsCubit extends Cubit <ContactUSStates>{
  ContactUsCubit():super(ContactUSStates());

  void sendData ({required String fullname,required String phone,required String content}) async {
    final response =await DioHelper().sendData("contact",data: {
      "fullname":fullname,
      "phone":phone,
      "title":"test",
      "content":content,
    });

    if(response!.isSuccess){
      showMessage(response.message);
      emit(ContactSuccessState());
    }else {
      emit(ContactFailedState());
    }
  }


}