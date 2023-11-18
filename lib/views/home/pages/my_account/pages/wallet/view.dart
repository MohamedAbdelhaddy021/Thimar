import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar/core/design/custome_appbar.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "المحفظة",
          onTap: () {
            Navigator.pop(context);
          }),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 168.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "رصيدك",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "245 ر.س",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 54.h,
              width: double.infinity,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2),
                      backgroundColor: Color(0xffF9FCF5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () {},
                  child: Text(
                    "اشحن الآن",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 23),
              child: Row(
                children: [
                  Text(
                    "سجل المعاملات",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "عرض الكل",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15.sp,
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => _ChargeItem(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemCount: 2,
              ),
            ),
            Container(
              height: 145,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17.r),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 11,
                        color: Colors.black.withOpacity(.03))
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/svg/payment_arrow.svg",
                          height: 18.w,
                          width: 18.w,
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Text(
                          "دفعت مقابل هذا الطلب",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "27,يونيو,2021,",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15.sp,
                              color: Color(0xff9C9C9C)),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ChargeItem extends StatelessWidget {
  const _ChargeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17.r),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 11,
                color: Colors.black.withOpacity(.03))
          ]),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/svg/payment_charge_arrow.svg",
                    height: 18.w,
                    width: 18.w,
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Text(
                    "شحن المحفظة",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "27,يونيو,2021,",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                        color: Color(0xff9C9C9C)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 49.0, bottom: 13),
              child: Text(
                "225 ر.س",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
