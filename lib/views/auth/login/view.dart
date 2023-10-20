import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        LoginCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.fill,
                  height: double.infinity,
                ),
                Form(
                  key: cubit.formKey,
                  child: ListView(
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
                        "مرحبا بك مرة أخرى",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme
                                .of(context)
                                .primaryColor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "يمكنك تسجيل الدخول الأن",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Color(0xff707070)),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      AppInput(
                        controller: cubit.phoneController,
                        image: "assets/images/phone.png",
                        bottom: 16,
                        isIcon: true,
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
                        bottom: 25,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("كلمة المرور غير صحيحة");
                          }
                          return null;
                        },
                      ),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(
                              onPressed: () {
                                navigateTo(ForgetPasswordView());
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
                                title: "تسجبل الدخول",
                                onPress: () async {
                                  cubit.login();
                                });
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
                            "ليس لديك حساب ؟",
                            style: TextStyle(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                              onPressed: () {
                                navigateTo(const RegisterView());
                              },
                              child: const Text(
                                "تسجيل الأن",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
