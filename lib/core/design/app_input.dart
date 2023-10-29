import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatefulWidget {
  final bool isPassword, isPhone, isEnabled;
  final double bottom;
  final Color fillColor,prefixColor;
  final String image, labelText;
  final FormFieldValidator<String?>? validator;
  final TextInputType inputType;
  final TextEditingController? controller;

  const AppInput({
    super.key,
    this.isPassword = false,
    required this.image,
    this.isPhone = false,
    this.bottom = 16,
    required this.labelText,
    this.isEnabled = true,
    this.controller,
    this.validator,
    this.inputType = TextInputType.text,
    this.fillColor = Colors.white,
    this.prefixColor = Colors.grey,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottom),
      child: TextFormField(
        onTapOutside: (event){
          FocusManager.instance.primaryFocus!.unfocus();
        },
        controller: widget.controller,
        validator: widget.validator,
        obscureText: isHidden && widget.isPassword,
        keyboardType: widget.inputType,
        style: TextStyle(
          fontSize: 14.sp,
          color: Theme.of(context).primaryColor
        ),
        decoration: InputDecoration(
          fillColor: widget.fillColor,
            enabled: widget.isEnabled,
            icon: widget.isPhone
                ? Container(
                    width: 60.h,
                    height: 60.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.w, color: const Color(0xffF3F3F3)),
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/saudi.png",
                          width: 32.w,
                          height: 20.h,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "966+",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        )
                      ],
                    ),
                  )
                : null,
            labelText: widget.labelText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      isHidden = !isHidden;
                      setState(() {});
                    },
                    icon: Icon(
                        isHidden ? Icons.visibility_off : Icons.visibility),
                  )
                : null,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
              color: widget.prefixColor,  widget.image,
                height: 20.h,
                width: 18.w,
              ),
            )),
      ),
    );
  }
}
