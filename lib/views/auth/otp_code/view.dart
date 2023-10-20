import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/design/app_button.dart';
import '../login/view.dart';
import 'cubit.dart';

class OtpCodeView extends StatefulWidget {
  final bool isActiveAccount;
  final String phone;

  const OtpCodeView(
      {super.key, required this.isActiveAccount, required this.phone});

  @override
  State<OtpCodeView> createState() => _OtpCodeViewState();
}

class _OtpCodeViewState extends State<OtpCodeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OTPCubit(),
      child: Builder(builder: (context) {
        OTPCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                      width: 130,
                      height: 126,
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      widget.isActiveAccount
                          ? "تفعيل الحساب"
                          : "نسيت كلمة المرور",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Color(0xff707070)),
                    ),
                    Row(
                      children: [
                        const Text(
                          "+9660548745",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Color(0xff707070)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "تغيير رقم الجوال",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PinCodeTextField(
                      controller: cubit.codeController,
                      appContext: (context),
                      length: 4,
                      textGradient: const LinearGradient(
                          colors: [Color(0xffC70039), Color(0xffA73121)]),
                      animationType: AnimationType.slide,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 60,
                        fieldWidth: 60,
                        borderRadius: BorderRadius.circular(15),
                        selectedColor: const Color(0xffF3F3F3),
                        activeFillColor: Colors.white,
                        inactiveColor: const Color(0xffF3F3F3),
                        activeColor: const Color(0xffF3F3F3),
                        borderWidth: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) => AppButton(
                          title: "تأكيد الكود",
                          onPress: () {
                            cubit.verify(widget.phone);
                          }),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    CircularCountDownTimer(
                      width: 66,
                      height: 66,
                      duration: 30,
                      initialDuration: 22,
                      isReverse: true,
                      textFormat: CountdownTextFormat.MM_SS,
                      controller: cubit.countDownController,
                      strokeWidth: 3,
                      onComplete: () {
                        cubit.isClickable = !cubit.isClickable;
                        setState(() {});
                      },
                      fillColor: const Color(0xffF3F3F3),
                      ringColor: const Color(0xff4C8613),
                      isReverseAnimation: true,
                    ),
                    const SizedBox(
                      height: 19.8,
                    ),
                    Center(
                        child: SizedBox(
                      height: 47,
                      child: OutlinedButton(
                          onPressed: cubit.isClickable
                              ? null
                              : () {
                                  cubit.countDownController.start();
                                  cubit.isClickable = !cubit.isClickable;
                                  setState(() {});
                                },
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: const Text(
                            "إعادة الإرسال",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                    )),
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
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
