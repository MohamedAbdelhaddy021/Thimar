import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void navigateTo(Widget page) {
  Navigator.of(navigatorKey.currentContext!)
      .push(MaterialPageRoute(builder: (_) => page));
}

void showMessage(String message) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: Colors.red,
  ));
  print(message);
}
