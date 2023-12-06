import 'package:flutter/material.dart';

class ControlButtonItem extends StatelessWidget {
  const ControlButtonItem({
    required this.width,
    required this.height,
    this.color = Colors.white,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    this.onTap,this.radius=9,
  });

  final double width, height, iconSize;
  final Color color, iconColor;
  final IconData icon;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          )),
    );
  }
}