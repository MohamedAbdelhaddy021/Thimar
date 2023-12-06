import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/views/auth/forget_password/cubit.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_methods.dart';
import '../otp_code/view.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Image.asset(
                "assets/images/background.png",
                fit: BoxFit.fill,
                height: double.infinity,
              ),
              Builder(builder: (context) {
                ForgetPasswordCubit cubit = BlocProvider.of(context);
                return ListView(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 130.w,
                      height: 126.h,
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Text(
                      "نسيت كلمة المرور",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "أدخل رقم الجوال المرتبط بحسابك",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                        color: const Color(0xff707070),
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Form(
                      key: cubit.formKey,
                      child: AppInput(
                        image: "assets/images/phone.png",
                        isPhone: true,
                        controller: cubit.phoneController,
                        labelText: "رقم الجوال",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "أدخل رقم الجوال ";
                          } else if (value.length < 10) {
                            return "حقل رقم الجوال على الأقل 10 حروف ";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    AppButton(
                        title: "تأكيد رقم الجوال ",
                        onPress: () {
                          cubit.forgetPassword();
                        }),
                    SizedBox(
                      height: 45.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " لديك حساب بالفعل ؟",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {
                              cubit.phoneController.clear();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
