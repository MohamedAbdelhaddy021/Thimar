import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar/views/auth/logout/cubit.dart';
import 'package:thimar/views/home/pages/my_account/pages/about_app/view.dart';
import 'package:thimar/views/home/pages/my_account/pages/contact_us/view.dart';
import 'package:thimar/views/home/pages/my_account/pages/edit_personal_details/view.dart';
import 'package:thimar/views/home/pages/my_account/pages/policy/view.dart';
import 'package:thimar/views/home/pages/my_account/pages/repeated_questions/view.dart';
import 'package:thimar/views/home/pages/my_account/pages/suggestions/view.dart';
import 'package:thimar/views/home/pages/my_account/pages/wallet/view.dart';

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
  ];
  List<String> urls2 = [
    "assets/icons/svg/questions.svg",
    "assets/icons/svg/privacy.svg",
    "assets/icons/svg/calling.svg",
    "assets/icons/svg/suggestion.svg",
    "assets/icons/svg/share.svg",
  ];
  List<String> urls3 = [
    "assets/icons/svg/about_app.svg",
    "assets/icons/svg/language.svg",
    "assets/icons/svg/constraints.svg",
    "assets/icons/svg/rate.svg",
  ];

  List<String> name = [
    "البيانات الشخصية",
    "المحفظة",
    "العناوين",
    "الدفع",
  ];
  List<String> name2 = [
    "أسئلة متكررة",
    "سياسة الخصوصية",
    "تواصل معنا",
    "الشكاوي والأقتراحات",
    "مشاركة التطبيق",
  ];
  List<String> name3 = [
    "عن التطبيق",
    "تغيير اللغة",
    "الشروط والأحكام",
    "تقييم التطبيق",
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
                  height: 200,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Item(
                        imgUrl: "assets/icons/svg/user.svg",
                        text: "البيانات الشخصية",
                        onTap: () {
                          navigateTo(EditDetailsPage());
                        },
                      ),
                      _Item(
                          imgUrl: "assets/icons/svg/wallet.svg",
                          text: "المحفظة",
                          onTap: () {
                            navigateTo(WalletPage());
                          }),
                      _Item(
                          imgUrl: "assets/icons/svg/location.svg",
                          text: "العناوين"),
                      _Item(
                          imgUrl: "assets/icons/svg/payment.svg",
                          text: "الدفع"),
                    ],
                  )),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 235,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Item(
                        imgUrl: "assets/icons/svg/questions.svg",
                        text: "أسئلة متكررة",onTap: (){
                          navigateTo(RepeatedQuestionsPage());
                    },),
                    _Item(
                        imgUrl: "assets/icons/svg/privacy.svg",
                        text: "سياسة الخصوصية",
                        onTap: () {
                          navigateTo(PrivacyPolicyPage());
                        }),
                    _Item(
                        imgUrl: "assets/icons/svg/phone.svg",
                        text: "تواصل معنا",
                      onTap: (){
                          navigateTo(ContactPage());
                      },
                    ),
                    _Item(
                        imgUrl: "assets/icons/svg/suggestion.svg",
                        text: "الشكاوي والأقتراحات",onTap: (){
                          navigateTo(SuggestionsPage());
                    }),
                    _Item(
                        imgUrl: "assets/icons/svg/share.svg",
                        text: "مشاركة التطبيق"),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 200,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Item(
                        imgUrl: "assets/icons/svg/about_app.svg",
                        text: "عن التطبيق",onTap: (){
                          navigateTo(AboutPage());
                    }),
                    _Item(
                        imgUrl: "assets/icons/svg/language.svg",
                        text: "تغيير اللغة"),
                    _Item(
                        imgUrl: "assets/icons/svg/constraints.svg",
                        text: "الشروط والأحكام"),
                    _Item(
                        imgUrl: "assets/icons/svg/rate.svg",
                        text: "تقييم التطبيق"),
                  ],
                ),
              ),
              Builder(builder: (context) {
                LogoutCubit cubit = BlocProvider.of(context);
                return GestureDetector(
                  onTap: () async {
                    // await CacheHelper.clear();
                    // navigateTo(const LoginView(),removeHistory: true);
                    cubit.logout();
                    navigateTo(LoginView(), removeHistory: true);
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
                );
              }),
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
    this.onTap,
  });

  final String imgUrl, text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.h, vertical: 10.h),
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
            onTap: onTap,
            child: SvgPicture.asset(
              "assets/icons/svg/rounded_arrow_left.svg",
              width: 25.w,
              height: 22.w,
              fit: BoxFit.scaleDown,
              color: const Color(0xffB2BCA8),
            ),
          )
        ],
      ),
    );
  }
}
