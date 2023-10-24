import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/views/auth/forget_password/cubit.dart';
import 'package:thimar/views/auth/login/cubit.dart';
import 'package:thimar/views/auth/register/cubit.dart';
import 'package:thimar/views/auth/reset_password/cubit.dart';
import 'package:thimar/views/home/pages/home/view.dart';
import 'package:thimar/views/home/view.dart';
import 'package:thimar/views/show_product/cubit.dart';
import 'package:thimar/views/splash/view.dart';
import 'core/logic/helper_methods.dart';
import 'features/category/cubit/cubit.dart';
import 'features/cities/bloc/cubit.dart';
import 'features/products/bloc/cubit.dart';
import 'features/slider/bloc/cubit.dart';
import 'views/auth/otp_code/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // status bar color
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(const ThimarApp());
}

class ThimarApp extends StatelessWidget {
  const ThimarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),BlocProvider(
          create: (context) => OTPCubit(),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => SliderCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => ProductCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => CitiesCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => ProductDetailsCubit()..getDetails(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ResetPasswordCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          builder: (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
          theme: ThemeData(
            fontFamily: "Tajawal",
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                centerTitle: true,
                // toolbarHeight: 100,
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: getMyMaterialColor(),
                  fontSize: 25,
                )),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                  const BorderSide(width: 1, color: Color(0xffF3F3F3))),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                  const BorderSide(width: 1, color: Color(0xffF3F3F3))),
              fillColor: Colors.white,
              filled: true,
            ),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            primarySwatch: getMyMaterialColor(),
          ),
          home: const HomeView(),
        ),
      ),
    );
  }
}

MaterialColor getMyMaterialColor() {
  Color color = const Color(0xff4C8613);
  return MaterialColor(color.value, {
    50: color.withOpacity(.1),
    100: color.withOpacity(.2),
    200: color.withOpacity(.3),
    300: color.withOpacity(.4),
    400: color.withOpacity(.5),
    500: color.withOpacity(.6),
    600: color.withOpacity(.7),
    700: color.withOpacity(.8),
    800: color.withOpacity(.9),
    900: color,
  });
}