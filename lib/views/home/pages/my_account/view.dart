import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/logic/cache_helper.dart';
import '../../../../core/logic/helper_methods.dart';
import '../../../auth/login/view.dart';

class MyAccountPage extends StatelessWidget {
  MyAccountPage({super.key});

  List<String> urls = [
    "assets/icons/svg/user.svg",
    "assets/icons/svg/wallet.svg",
    "assets/icons/svg/location.svg",
    "assets/icons/svg/payment.svg",
    "assets/icons/svg/questions.svg",
    "assets/icons/svg/privacy.svg",
    "assets/icons/svg/calling.svg",
    "assets/icons/svg/suggestion.svg",
    "assets/icons/svg/share.svg",
  ];

  List<String> name = [
    "البيانات الشخصية",
    "المحفظة",
    "العناوين",
    "الدفع",
    "أسئلة متكررة",
    "سياسة الخصوصية",
    "تواصل معنا",
    "الشكاوي والأقتراحات",
    "مشاركة التطبيق",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 217.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.r),
                        bottomRight: Radius.circular(40.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "حسابي",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          width: 71.w,
                          height: 71.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Colors.transparent),
                          child: Image.asset("assets/images/profile_img.jpg",
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "محمد عبدالهادي",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "+201098603578",
                          style: TextStyle(
                              color: const Color(0xffA2D273),
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/account_bg.png",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 200.h,
                margin: EdgeInsets.symmetric(horizontal: 17.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        offset: const Offset(0, 11),
                        blurRadius: 11.r,
                        blurStyle: BlurStyle.outer)
                  ],
                ),
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      _Item(imgUrl: urls[index], text: name[index]),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: .7,
                    color: Color(0xffF6F6F6),
                  ),
                  itemCount: urls.length,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 250.h,
                margin: EdgeInsets.symmetric(horizontal: 17.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        offset: const Offset(0, 11),
                        blurRadius: 11.r,
                        blurStyle: BlurStyle.outer)
                  ],
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                  itemBuilder: (context, index) =>
                      _Item(imgUrl: urls[index], text: name[index]),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: .7,
                    color: Color(0xffF6F6F6),
                  ),
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 200.h,
                margin: EdgeInsets.symmetric(horizontal: 17.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        offset: const Offset(0, 11),
                        blurRadius: 11.r,
                        blurStyle: BlurStyle.outer)
                  ],
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                  itemBuilder: (context, index) =>
                      _Item(imgUrl: urls[index], text: name[index]),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: .7,
                    color: Color(0xffF6F6F6),
                  ),
                  itemCount: 4,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await CacheHelper.clear();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const LoginView()));
                },
                child: Container(
                  height: 50.h,
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: 16.h, vertical: 20.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 11.r,
                            offset: const Offset(0, 1),
                            color: Colors.black.withOpacity(.05),
                            blurStyle: BlurStyle.outer)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تسجيل الخروج",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/svg/turn_off.svg",
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    super.key,
    required this.imgUrl,
    required this.text,
  });

  final String imgUrl, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.h, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            imgUrl,
            width: 14.w,
            height: 18.h,
            fit: BoxFit.scaleDown,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 9.w,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Tajawal",
                color: Theme.of(context).primaryColor),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              debugPrint("Tesssssst");
            },
            child: SvgPicture.asset(
              "assets/icons/svg/rounded_arrow_left.svg",
              width: 20.w,
              height: 20.w,
              fit: BoxFit.scaleDown,
              color: const Color(0xffB2BCA8),
            ),
          )
        ],
      ),
    );
  }
}
