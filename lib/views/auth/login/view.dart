import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/views/auth/login/states.dart';
import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_methods.dart';
import '../forget_password/view.dart';
import '../register/view.dart';
import 'cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     cubit = BlocProvider.of(context);
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Stack(
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
                    width: 130.w,
                    height: 126.h,
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  Text(
                    "مرحبا بك مرة أخرى",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "يمكنك تسجيل الدخول الأن",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                        color: const Color(0xff707070)),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  AppInput(
                    controller: cubit.phoneController,
                    image: "assets/images/phone.png",
                    bottom: 16.h,
                    isPhone: true,
                    inputType: TextInputType.number,
                    labelText: 'رقم الجوال',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("رقم الجوال غير متوفر");
                      }
                      return null;
                    },
                  ),
                  AppInput(
                    controller: cubit.passwordController,
                    image: "assets/images/lock.png",
                    isPassword: true,
                    labelText: 'كلمة المرور',
                    bottom: 25.h,
                    inputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("كلمة المرور غير صحيحة");
                      }
                      return null;
                    },
                  ),
                  Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: TextButton(
                          onPressed: () {
                            navigateTo(const ForgetPasswordView(),);
                          },
                          child: const Text(
                            "نسيت كلمة المرور ؟",
                            style: TextStyle(color: Color(0xff707070)),
                          ))),
                  BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const Center(
                            child: CircularProgressIndicator());
                      } else {
                        return AppButton(
                            title: "تسجيل الدخول",
                            onPress: () async {
                              cubit.login();
                            });
                      }
                    },
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ليس لديك حساب ؟",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          onPressed: () {
                            navigateTo(const RegisterView(),);
                          },
                          child: Text(
                            "تسجيل الأن",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w700),
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
