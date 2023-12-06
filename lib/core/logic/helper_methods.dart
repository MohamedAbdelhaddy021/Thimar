import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void navigateTo(Widget page, { bool removeHistory =false }) {
  // Navigator.push(navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => page,));
  Navigator.pushAndRemoveUntil(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => page,
    ),
    (route) => !removeHistory,
  );
}

void showMessage(String message) {
  if (message.isNotEmpty) {
    ScaffoldMessenger.of(
      navigatorKey.currentState!.context,
    ).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      closeIconColor: Colors.red,
    ));
    debugPrint(message);
  }
}
