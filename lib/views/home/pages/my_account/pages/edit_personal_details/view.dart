import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/design/app_button.dart';
import '../../../../../../core/design/app_input.dart';
import '../../../../../../core/design/custome_appbar.dart';
import '../../../../../../features/cities/cities.dart';
import '../../../../../sheets/cities.dart';

class EditDetailsPage extends StatefulWidget {
  EditDetailsPage({super.key});

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  CityModel? selectedCity;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
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
          "البيانات الشخصية",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      ),
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
                      Stack(
                        alignment: Alignment.center,
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
                            child: imagePath != null
                                ? Image.file(
                                    File(imagePath!),
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/profile_img.jpg",
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          InkWell(
                              onTap: () async {
                                var file = await ImagePicker.platform
                                    .getImageFromSource(
                                        source: ImageSource.camera);
                                if (file != null) {
                                  imagePath = file.path;
                                  setState(() {});
                                }
                              },
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: 50,
                                color: Colors.white70,
                              ))
                        ],
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
                inputType: TextInputType.phone,
                image: "assets/images/phone.png",
                labelText: "رقم الجوال",
                isPhone: true,
                bottom: 16.h,
                prefixColor: Theme.of(context).primaryColor,
                fillColor: const Color(0xffFAFFF5),
              ),
              StatefulBuilder(
                builder: (context, setState) => GestureDetector(
                  onTap: () async {
                    final result = await showModalBottomSheet(
                        context: context,
                        builder: (context) => const CitiesSheet());
                    setState(() {});
                    if (result != null) {
                      selectedCity = result;
                      setState(() {});
                    }
                  },
                  child: AbsorbPointer(
                    absorbing: true,
                    child: AppInput(
                      image: "assets/images/flag.png",
                      labelText: selectedCity?.name ?? "المدينة",
                      bottom: 16.h,
                      prefixColor: Theme.of(context).primaryColor,
                      fillColor: const Color(0xffFAFFF5),
                      validator: (value) {
                        if (selectedCity == null) {
                          return "برجاء ادخال المدينة";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              AppInput(
                image: "assets/images/lock.png",
                labelText: "كلمة المرور",
                bottom: 16.h,
                isPassword: true,
                prefixColor: Theme.of(context).primaryColor,
                fillColor: const Color(0xffFAFFF5),
              ),
              SizedBox(
                height: 178.h,
              ),
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
