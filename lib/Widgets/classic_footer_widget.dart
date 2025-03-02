import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class ClassicFooterWidget extends StatelessWidget {
  const ClassicFooterWidget({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      iconPos: IconPosition.top,
      outerBuilder: (child) {
        return SizedBox(
          width: 80.w,
          child: Center(
            child: child,
          ),
        );
      },
    );
  }
}
