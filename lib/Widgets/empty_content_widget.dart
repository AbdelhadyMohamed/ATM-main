import 'package:atm/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Utilities/constants.dart';
import '../Utilities/strings.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class EmptyContentWidget extends StatelessWidget {
  final String? image,msg;
  final double? height;
  const EmptyContentWidget({Key? key, this.image, this.msg,  this.height, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.0.w),
            child: SvgPicture.asset(
                image??"assets/images/no_result_found.svg",height: height??150.h,),
          ),
          space20Vertical,
          Center(
            child: Text(msg??Strings.noResultFound.tr,style: TextStyleHelper.of(context).body18.copyWith(
              fontWeight: FontWeight.w600,
              color: ThemeClass.of(context).primaryColor
            ),),
          ),          space20Vertical,

        ],
      ),
    );
  }
}
