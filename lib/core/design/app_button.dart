import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatefulWidget {
  final String title;
  final VoidCallback onPress;
  final Color? color;
  final Color? textColor;
  final double? radius;
  final double? height;
  final double? width;

  const AppButton({
    super.key,
    required this.title,
    required this.onPress,
    this.color,
    this.radius = 15,
    this.textColor,
    this.height=60,
    this.width,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: FilledButton(
          onPressed: widget.onPress,
          style: FilledButton.styleFrom(
              backgroundColor: widget.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.radius!))),
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          )),
    );
  }
}
