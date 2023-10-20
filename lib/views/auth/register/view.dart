import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/auth/register/states.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_methods.dart';
import '../../sheets/cities.dart';
import '../login/view.dart';
import 'cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        RegisterCubit cubit = BlocProvider.of(context);
        return SafeArea(
          child: Container(
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
                            color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "يمكنك تسجيل حساب جديد الأن",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Color(0xff707070)),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      AppInput(
                        controller: cubit.fullNameController,
                        image: "assets/images/person.png",
                        labelText: 'اسم المستخدم',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("اسم المستخدم غير موجود");
                          }
                          return null;
                        },
                      ),
                      AppInput(
                        controller: cubit.phoneController,
                        image: "assets/images/phone.png",
                        isIcon: true,
                        labelText: "رقم الجوال",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("رقم الجوال غير موجود");
                          }
                          return null;
                        },
                      ),
                      StatefulBuilder(
                        builder: (context, setState) => GestureDetector(
                          onTap: () async {
                            final result =
                                await showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        const CitiesSheet());
                            setState(() {});
                            if(result!=null){
                              cubit.selectedCity =result;
                              setState((){});
                            }
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: AppInput(
                                    image: "assets/images/flag.png",
                                    labelText:
                                        cubit.selectedCity?.name ?? "المدينة",
                                    validator: (value) {
                                      if (cubit.selectedCity == null) {
                                        return "برجاء ادخال المدينة";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              if(cubit.selectedCity!=null)
                              Padding(
                                padding:  const EdgeInsetsDirectional.only(start:8,bottom: 40.0),
                                child: IconButton(
                                    onPressed: () {
                                      cubit.selectedCity =null;
                                      setState((){});
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      size: 28,
                                      color: Theme.of(context).primaryColor,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      AppInput(
                        controller: cubit.passwordController,
                        isPassword: true,
                        image: "assets/images/lock.png",
                        labelText: "كلمة المرور",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("كلمة المرور غير موجود");
                          }
                          return null;
                        },
                      ),
                      AppInput(
                        controller: cubit.confirmationPasswordController,
                        isPassword: true,
                        image: "assets/images/lock.png",
                        labelText: "كلمة المرور",
                        bottom: 24,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("كلمة المرور غير موجود");
                          }
                          return null;
                        },
                      ),
                      BlocBuilder(
                          bloc: cubit,
                          builder: (context, state) {
                            if (state is RegisterLoadingState) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return AppButton(
                                  title: "تسجيل",
                                  onPress: () {
                                    cubit.register();
                                  });
                            }
                          }),
                      const SizedBox(
                        height: 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "لديك حساب بالفعل ؟",
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
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
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
