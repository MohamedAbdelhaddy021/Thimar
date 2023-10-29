import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/views/auth/reset_password/cubit.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_methods.dart';
import '../login/view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.phone, required this.code});

  final String phone, code;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
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
            Builder(builder: (context) {
              ResetPasswordCubit cubit = BlocProvider.of(context);
              return Form(
                key: cubit.formKey,
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 130.w,
                      height: 126.h,
                    ),
                    SizedBox(
                      height: 24.h,
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
                      "أدخل كلمة المرور الجديدة",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15.sp,
                          color: const Color(0xff707070)),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    AppInput(
                      image: "assets/images/lock.png",
                      labelText: "كلمة المرور",
                      isPassword: true,
                      controller: cubit.passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "يجب ادخال كلمة المرور صحيحة ";
                        } else if (value.length < 8) {
                          return "حقل كلمة المرور على الأقل 8 حروف ";
                        }
                        return null;
                      },
                    ),
                    AppInput(
                      image: "assets/images/lock.png",
                      labelText: "كلمة المرور",
                      isPassword: true,
                      bottom: 25.h,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "يجب ادخال كلمة المرور صحيحة";
                        } else if (value.length < 8) {
                          return "حقل كلمة المرور على الأقل 8 حروف ";
                        } else if (value != cubit.passwordController.text) {
                          return "كلمتان المرور غير متطابقة ";
                        }
                        return null;
                      },
                    ),
                    AppButton(
                      title: "تغيير كلمة المرور",
                      onPress: () {
                        cubit.resetPassword(
                            phone: widget.phone, code: widget.code);
                        debugPrint(widget.phone);
                      },
                    ),
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
                              navigateTo(const LoginView(),);
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
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
