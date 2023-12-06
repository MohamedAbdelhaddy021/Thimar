import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar/core/design/app_button.dart';
import 'package:thimar/core/design/custom_icon_filled_button.dart';

class CompleteTheOrder extends StatelessWidget {
  const CompleteTheOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 200,
            height: 32,
            padding: EdgeInsetsDirectional.only(
              start: 8,
            ),
            margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Theme.of(context).primaryColor.withOpacity(0.13),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        title: Text("إتمام الطلب"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الاسم : محمد ",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp),
              ),
              SizedBox(
                height: 11,
              ),
              Text(
                "الجوال  : 05068285914 ",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp),
              ),
              SizedBox(
                height: 36,
              ),
              Row(
                children: [
                  _Item(title: "اختر عنوان التوصيل"),
                  Spacer(),
                  ControlButtonItem(
                    width: 26,
                    height: 26,
                    icon: Icons.add,
                    iconColor: Theme.of(context).primaryColor,
                    iconSize: 20,
                    color: Theme.of(context).primaryColor.withOpacity(.13),
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1.5)),
                child: Row(
                  children: [
                    Text(
                      "المنزل : 119 طريق الملك عبدالعزيز",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                    ),
                    Spacer(),
                    DropdownButton(
                      items: [],
                      iconSize: 30,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      onChanged: (value) {},
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              _Item(title: "تحديد وقت التوصيل "),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.withOpacity(.3), width: 1.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "اختر اليوم و التاريخ",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              "assets/icons/svg/calendar.svg",
                              width: 25,
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "اختر الوقت",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                "assets/icons/svg/time.svg",
                                width: 25,
                              ),
                            ],
                          ))),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              _Item(title: "ملاحظات وتعليمات"),
              SizedBox(
                height: 7.h,
              ),
              TextFormField(
                maxLines: 8,
                minLines: 6,
              ),
              SizedBox(
                height: 26.h,
              ),
              _Item(title: "اختر طريقة الدفع"),
              SizedBox(height: 10,),
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    _PayItem(text: "كاش", imgPath: "assets/icons/svg/cash.svg"),
                    SizedBox(width: 16.w,),
                    _PayItem( imgPath: "assets/icons/svg/visa.svg"),
                    SizedBox(width: 16.w,),
                    _PayItem( imgPath: "assets/icons/svg/mastercard.svg"),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              _Item(title: "ملخص الطلب"),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.r),
                    color: Color(0xffF3F8EE)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _DetailsItem(name: "إجمالي المنتجات", price: "180"),
                    _DetailsItem(name: "سعر التوصيل", price: "40"),
                    _DetailsItem(name: "الخصم", price: "-40"),
                    Divider(),
                    _DetailsItem(name: "المجموع", price: "180"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: AppButton(title: "إنهاء الطلب", onPress: () {}))
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.sp,
          color: Theme.of(context).primaryColor),
    );
  }
}

class _DetailsItem extends StatelessWidget {
  const _DetailsItem({super.key, required this.name, required this.price});

  final String name, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor),
        ),
        Spacer(),
        Text(
          "${price} ر.س",
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}

class _PayItem extends StatelessWidget {
  const _PayItem({super.key,  this.text, required this.imgPath});
  final String? text;

      final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.h,
        width: 104.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11.r),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imgPath,width: 30,height: 24,),
            SizedBox(width: 7,),
            Text(text??"",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}

