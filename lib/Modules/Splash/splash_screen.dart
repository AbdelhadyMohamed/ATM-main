import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify/Modules/Splash/splash_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  _SplashScreenState() : super(SplashController()) {
    con = SplashController();
  }

  late SplashController con;


  @override
  void initState() {
    con.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          // width: 250.w,
          // height: 250.h,
          child: Image.asset(
            Assets.imagesLogo,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      // )
    );
  }
}

