import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void navigateTo(Widget page)  {
  Navigator.push(
    navigatorKey.currentState!.context,
    MaterialPageRoute(builder: (BuildContext context) => page),
  );
}

void showMessage(String message) {
  ScaffoldMessenger.of(navigatorKey.currentState!.context,).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: Colors.red,
  ));
  debugPrint(message);
}
