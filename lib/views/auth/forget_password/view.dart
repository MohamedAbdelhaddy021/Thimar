import 'package:flutter/material.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_methods.dart';
import '../create_new_password/view.dart';
import '../login/view.dart';

class ForgetPasswordView extends StatelessWidget {
   ForgetPasswordView({super.key});

  final formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/background.png",
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/images/background.png",
                    fit: BoxFit.fill,
                    height: double.infinity,
                  ),
                  ListView(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 130,
                        height: 126,
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Text(
                        "نسيت كلمة المرور",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "أدخل رقم الجوال المرتبط بحسابك",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Color(0xff707070)),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Form(
                        key: formKey,
                        child: AppInput(
                          image: "assets/images/phone.png",
                          isIcon: true,
                          labelText: "رقم الجوال",
                          validator: (value){
                            if(value!.isEmpty){
                              return "يجب ادخال كلمة المرور صحيحة";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      AppButton(
                          title: "تأكيد رقم الجوال ",
                          onPress: () {
                            if(formKey.currentState!.validate()){
                              navigateTo(const CreateNewPasswordView());
                            }
                          }
                           ),
                      const SizedBox(
                        height: 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " لديك حساب بالفعل ؟",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                              onPressed: () {
                                navigateTo(const LoginView());
                              },
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
