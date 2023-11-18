import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
