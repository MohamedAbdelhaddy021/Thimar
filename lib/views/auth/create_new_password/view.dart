import 'package:flutter/material.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_methods.dart';
import '../login/view.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({super.key});

  @override
  State<CreateNewPasswordView> createState() =>
      _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
  bool passIsHidden = true;
  bool passConfirmIsHidden = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Form(
              key: formKey,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 130,
                    height: 126,
                  ),
                  const SizedBox(
                    height: 24,
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
                    "أدخل كلمة المرور الجديدة",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Color(0xff707070)),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  AppInput(
                    image: "assets/images/lock.png",
                    labelText: "كلمة المرور",
                    isPassword: true,
                    validator: (value){
                      if (value!.isEmpty){
                        return "يجب ادخال كلمة المرور صحيحة ";
                      }
                      return null;
                    },
                  ),
                  AppInput(
                    image: "assets/images/lock.png",
                    labelText: "كلمة المرور",
                    isPassword: true,
                    bottom: 25,
                    validator: (value){
                      if(value!.isEmpty){
                        return "يجب ادخال كلمة المرور صحيحة";
                      }
                      return null;
                    },
                  ),
                  AppButton(
                    title: "تغيير كلمة المرور",
                    onPress: () {
                      if (formKey.currentState!.validate()){
                        navigateTo(const LoginView());
                      }
                    },
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const LoginView()));
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
