import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/design/app_button.dart';
import '../../../../../../core/design/app_input.dart';
import '../../../../../../core/design/custome_appbar.dart';


class PersonalDetailsPage extends StatelessWidget {
  const PersonalDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0.h, bottom: 18.h),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 85.h,
                        height: 88.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15.r,
                          ),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Image.asset(
                          "assets/images/profile_img.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        "محمد عبدالهادي",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Tajawal",
                            fontSize: 17.sp),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "+201098603578",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 17.sp),
                      ),
                    ],
                  ),
                ),
              ),
              AppInput(
                image: "assets/images/person.png",
                labelText: "اسم المستخدم",
                bottom: 16.h,
                prefixColor: Theme.of(context).primaryColor,
                fillColor: const Color(0xffFAFFF5),
              ),
              AppInput(
                image: "assets/images/phone.png",
                labelText: "رقم الجوال",
                isPhone: true,
                bottom: 16.h,
                prefixColor: Theme.of(context).primaryColor,
                fillColor: const Color(0xffFAFFF5),
              ),
              AppInput(
                image: "assets/images/flag.png",
                labelText: "المدينة",
                bottom: 16.h,
                prefixColor: Theme.of(context).primaryColor,
                fillColor: const Color(0xffFAFFF5),
              ),
              AppInput(
                image: "assets/images/lock.png",
                labelText: "كلمة المرور",
                bottom: 16.h,
                isPassword: true,
                prefixColor: Theme.of(context).primaryColor,
                fillColor: const Color(0xffFAFFF5),
              ),
              SizedBox(height: 178.h,),
              AppButton(
                title: "تعديل البيانات",
                onPress: () {},
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
