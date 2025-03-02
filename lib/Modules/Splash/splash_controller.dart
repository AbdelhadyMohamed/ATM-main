import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hypelify/Modules/home/home_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/shared_preferences.dart';
import '../Auth/Login/login_screen.dart';

class SplashController extends ControllerMVC {
  // singleton
  factory SplashController() {
    _this ??= SplashController._();
    return _this!;
  }
  static SplashController? _this;
  SplashController._();



  Future init(BuildContext context) async{
    await Future.delayed(const Duration(seconds: 2));
    String routeName;
    if (SharedPref.isLogin()) {
      routeName = HomeScreen.routeName;
    } else {
      routeName = LoginScreen.routeName;
    }
    if(context.mounted) context.pushNamed(routeName);
  }
}
