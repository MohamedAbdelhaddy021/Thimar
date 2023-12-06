import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar/core/design/app_button.dart';
import 'package:thimar/views/home/pages/my_account/pages/contact_us/cubit.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final _fullnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _msgContent = TextEditingController();

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
                color: Theme
                    .of(context)
                    .primaryColor
                    .withOpacity(0.13),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
              ),
            ),
          ),
          title: Text(
            "تواصل معنا",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Image.asset("assets/images/map_testing.png"),
              Column(
                children: [
                  SizedBox(
                    height: 130.h,
                  ),
                  Container(
                    height: 120.h,
                    width: 312.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 6),
                            blurRadius: 17,
                            color: Colors.black.withOpacity(.06),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _BoxItem(
                          title:
                          "شارع الملك فهد , جدة , المملكة العربية السعودية",
                          imgPath: "assets/icons/svg/location.svg",
                        ),
                        _BoxItem(
                          title: " 96605487452+",
                          imgPath: "assets/icons/svg/calling.svg",
                        ),
                        _BoxItem(
                          title:
                          "info@thimar.com",
                          imgPath: "assets/icons/svg/email_fill.svg",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "أو يمكنك إرسال رسالة ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        color: Theme
                            .of(context)
                            .primaryColor),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  _Item(hintText: "الإسم", controller: _fullnameController),
                  SizedBox(
                    height: 10.h,
                  ),
                  _Item(hintText: "رقم الموبايل", controller: _phoneController),
                  SizedBox(
                    height: 10.h,
                  ),
                  _Item(
                    hintText: "الموضوع",
                    minLines: 3,
                    maxLines: 5,
                    controller: _msgContent,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: AppButton(title: "إرسال", onPress: () {
                        BlocProvider.of<ContactUsCubit>(context).sendData(
                          fullname: _fullnameController.text,
                          phone: _phoneController.text,
                          content: _msgContent.text,
                        );
                      }))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key,
    required this.hintText,
    this.minLines = 1,
    this.maxLines = 1, required this.controller});

  final String hintText;
  final int minLines, maxLines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Color(0xffDCDCDC), width: 2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Color(0xffDCDCDC), width: 2.w),
        ),
        hintText: hintText,
      ),
    );
  }
}

class _BoxItem extends StatelessWidget {
  const _BoxItem({super.key, required this.title, required this.imgPath});

  final String title, imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(imgPath),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 12.5.sp, fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }
}
