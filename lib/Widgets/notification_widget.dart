import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/notification_model.dart';
import '../Utilities/helper.dart';
import '../Utilities/theme_helper.dart';


class NotificationWidget extends StatelessWidget {
  final NotificationModel notification;
  final String date;

  const NotificationWidget({
    Key? key,
    required this.notification,
    required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        date == ''
            ? const SizedBox()
            : Padding(
                padding:  EdgeInsets.only(top: 8.h),
                child: Text(date,
                    style:  TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    )),
        ),
        Padding(
          padding:  EdgeInsets.all(8.w),
          child: Container(
            padding:  EdgeInsets.all(8.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ThemeClass.of(context).medGrey.withOpacity(0.1),
            ),
            child: Row(children: [

               SizedBox(
                width: 8.w,
              ),
              SizedBox(
                width: 240.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      notification.notification?.notification?.title??"",
                      style:  TextStyle(
                      color: ThemeClass.of(context).primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                    ),
                    Text(
                      notification.notification?.notification?.body??"",
                      style:  TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 10.sp,
                  ),
                )
                  ],
                ),
              ),
              const Spacer(),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    Helper.formatterHHmm.format(notification.createdAt ?? DateTime.now()),
                    style: TextStyle(color: Colors.grey[500]),
                  )),
            ]),
          ),
        ),
      ],
    );
  }
}
