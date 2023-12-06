import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/design/app_button.dart';
import '../contact_us/cubit.dart';

class SuggestionsPage extends StatelessWidget {
  SuggestionsPage({super.key});

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
          title: Text(
            "الأقتراحات والشكاوي",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                child: AppButton(
                    title: "إرسال",
                    onPress: () {
                      BlocProvider.of<ContactUsCubit>(context).sendData(
                        fullname: _fullnameController.text,
                        phone: _phoneController.text,
                        content: _msgContent.text,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
      {super.key,
      required this.hintText,
      this.minLines = 1,
      this.maxLines = 1,
      required this.controller});

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
