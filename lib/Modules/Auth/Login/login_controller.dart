import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../models/user_model.dart';
import '../../../Utilities/router_config.dart';
import '../../../Utilities/shared_preferences.dart';
import '../../home/home_screen.dart';
import 'login_data_handler.dart';

class LoginController extends ControllerMVC {
  // singleton
  factory LoginController() {
    _this ??= LoginController._();
    return _this!;
  }

  static LoginController? _this;

  LoginController._();

  bool loading = false, autoValidate = false;
  UserModel? userModel;

  late TextEditingController phoneController,passwordController;

  @override
  void initState() {
    phoneController = TextEditingController(text: kDebugMode ? "testuser" : '');
    passwordController = TextEditingController(text: kDebugMode ? "12345678" : '');
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  reset() {
    loading = false;
    autoValidate = false;
  }

  Future<void> logIn() async {
    setState(() => loading = true);
    final result = await LoginDataHandler.login(phone: phoneController.text,password: passwordController.text);
    result.fold((l) => null, (r){
     SharedPref.saveCurrentUser(user: r);
     currentContext_!.pushReplacementNamed(HomeScreen.routeName);
    });
    setState(() => loading = false);
  }






}
