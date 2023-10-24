import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SizedBox(
      height: 60.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              debugPrint("Go back");
            },
            child: Container(
              width: 38.h,
              height: 38.h,
              margin: EdgeInsetsDirectional.only(start: 8),
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .primaryColor
                    .withOpacity(.13),
                borderRadius: BorderRadius.circular(9.r),
              ),
              padding: EdgeInsetsDirectional.only(start: 8.w),
              child: Icon(Icons.arrow_back_ios,
                  color: Theme
                      .of(context)
                      .primaryColor),
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsetsDirectional.only(end: 16.0.w),
              child: Text(
                "البيانات الشخصية",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0.sp,
                    color: Theme
                        .of(context)
                        .primaryColor,
                    fontWeight: FontWeight.bold, fontFamily: "Tajawal"
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
