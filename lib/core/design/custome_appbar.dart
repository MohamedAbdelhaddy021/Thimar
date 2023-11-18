import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SizedBox(
      height: 60.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
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
          SizedBox(width: MediaQuery.of(context).size.width/3.7,),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
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
