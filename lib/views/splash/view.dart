import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:thimar/views/home/view.dart';

import '../../core/logic/cache_helper.dart';
import '../auth/login/view.dart';
import '../home/pages/home/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CacheHelper.isAuth() ? const HomeView() : const LoginView(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            FlipInX(
              child: Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 160,
                  height: 157,
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              right: -130,
              child: Image.asset(
                "assets/images/top_view.png",
                width: 410,
                height: 404,
              ),
            )
          ],
        ),
      ),
    );
  }
}
