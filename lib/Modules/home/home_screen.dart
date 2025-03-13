import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utilities/LayoutHelper/loading_screen.dart';
import '../../../Utilities/constants.dart';
import '../Auth/Login/login_screen.dart';
import '../Auth/Visits/visits_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: LoadingScreen(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('الصفحة الرئيسية',style: TextStyle(color: Colors.black),),
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: const SizedBox(),
              actions:  [InkWell(
                  onTap:() =>context.pushReplacementNamed(LoginScreen.routeName),
                  child: const Icon(Icons.logout)),SizedBox(width: 5.w)],
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                children: [
                  space100Vertical,
                  InkWell(
                    onTap: () {
                      context.pushNamed(VisitsScreen.routeName);

                    },
                    child: Container(
                      height: 100.h,
                      width: 250.w,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        'الزيارات',
                        style: TextStyle(color: Colors.white, fontSize: 24.sp),
                      )),
                    ),
                  ),
                  // space20Vertical,
                  // InkWell(
                  //   onTap: () {
                  //     context.pushNamed(VisitsScreen.routeName);
                  //   },
                  //   child: Container(
                  //     height: 100.h,
                  //     width: 250.w,
                  //     decoration: BoxDecoration(
                  //         color: Colors.blue,
                  //         borderRadius: BorderRadius.circular(8)),
                  //     child: Center(
                  //         child: Text(
                  //       'قائمه المهام',
                  //       style: TextStyle(color: Colors.white, fontSize: 24.sp),
                  //     )),
                  //   ),
                  // ),
                  // space20Vertical,
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 100.h,
                  //     width: 250.w,
                  //     decoration: BoxDecoration(
                  //         color: Colors.blue,
                  //         borderRadius: BorderRadius.circular(8)),
                  //     child: Center(
                  //         child: Text(
                  //       'المشاكل',
                  //       style: TextStyle(color: Colors.white, fontSize: 24.sp),
                  //     )),
                  //   ),
                  // ),
                  space20Vertical,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
