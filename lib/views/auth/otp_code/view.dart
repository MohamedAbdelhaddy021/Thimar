import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar/core/logic/helper_methods.dart';

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
    return Builder(builder: (context) {
      OTPCubit cubit = BlocProvider.of(context);
      return Scaffold(
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
                    widget.isActiveAccount
                        ? "تفعيل الحساب"
                        : "نسيت كلمة المرور",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Theme.of(context).primaryColor),
                  ),
                   SizedBox(
                    height: 10.h
                  ),
                   Text(
                    "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                        color: const Color(0xff707070)),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.phone,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                            color: const Color(0xff707070)),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "تغيير رقم الجوال",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
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
                      fieldHeight: 60.h,
                      fieldWidth: 60.h,
                      borderRadius: BorderRadius.circular(15.r),
                      selectedColor: const Color(0xffF3F3F3),
                      activeFillColor: Colors.white,
                      inactiveColor: const Color(0xffF3F3F3),
                      activeColor: const Color(0xffF3F3F3),
                      borderWidth: 1,
                    ),
                  ),
                  SizedBox(
                    height: 37.h,
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
                  StatefulBuilder(
                    builder: (context, setState) =>CircularCountDownTimer(
                      width: 66.w,
                      height: 66.w,
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: SizedBox(
                    height: 47.h,
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
                                borderRadius: BorderRadius.circular(15.r))),
                        child: Text(
                          "إعادة الإرسال",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        )),
                  )),
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
                            navigateTo(const LoginView());
                          },
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15.sp,
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
    });
  }
}
