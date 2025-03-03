import 'package:animate_do/animate_do.dart';
import 'package:atm/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utilities/LayoutHelper/loading_screen.dart';
import '../../../Utilities/constants.dart';
import '../../../Utilities/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/validate.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/custom_textfield_widget.dart';
import '../../../Widgets/title_text_widget.dart';
import '../../../generated/assets.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  _LoginScreenState() : super(LoginController()) {
    con = LoginController();
  }

  late LoginController con;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: LoadingScreen(
          loading: con.loading,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKey,
                  autovalidateMode: con.autoValidate
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        space100Vertical,
                        // Center(
                        //   child: FadeInLeft(
                        //       delay: const Duration(milliseconds: 500),
                        //       child: SvgPicture.asset(Assets.imagesLogo)),
                        // ),
                        Center(
                          child: Image.asset(
                            Assets.imagesLogo,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        space70Vertical,
                        Center(
                          child: Text("تسجيل الدخول لحسابك",
                              style: TextStyleHelper.of(context).title18),
                        ),
                        space30Vertical,

                        TitleTextWidget(title: "اسم الحساب"),
                        space8Vertical,
                        FadeInRight(
                          delay: const Duration(milliseconds: 500),
                          child: CustomTextFieldWidget(
                            maxLength: 11,
                            controller: con.phoneController,
                            hint: Strings.email.tr,
                            textInputType: TextInputType.text,
                            validator: Validate.validateNormalString,
                          ),
                        ),
                        // space16Vertical,

                        TitleTextWidget(title: "كلمة المرور"),
                        space8Vertical,
                        FadeInRight(
                          delay: const Duration(milliseconds: 500),
                          child: CustomTextFieldWidget(
                            obscure: true,
                            controller: con.passwordController,
                            hint: Strings.password.tr,
                            // validator: Validate.validatePasswordLogin,
                          ),
                        ),
                        space70Vertical,
                        Center(
                          child: CustomButtonWidget.primary(

                            title: "تسجيل الدخول",
                            onTap: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                con.logIn();
                              } else {
                                setState(() {
                                  con.autoValidate = true;
                                });
                              }
                            },
                          ),
                        ),

                        SizedBox(
                          height: 40.h,
                        ),
                        // const Spacer(),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
