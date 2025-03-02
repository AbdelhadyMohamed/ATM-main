import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

enum ButtonTypes {primary,secondary,outline}

class CustomButtonWidget extends StatelessWidget {
  final Widget? child;
  final String? title;
  final double? width,height;
  final ButtonTypes buttonTypes;
  final Function()? onTap;
  final double? radius;

  double get _radius => 8.r;

  const CustomButtonWidget.primary({super.key,this.radius, this.width,this.height,this.title,this.onTap,this.child}): buttonTypes = ButtonTypes.primary;
  const CustomButtonWidget.secondary({super.key,this.radius, this.width,this.height,this.title,this.onTap,this.child}): buttonTypes = ButtonTypes.secondary;
  const CustomButtonWidget.outline({super.key,this.radius, this.width,this.height,this.title,this.onTap,this.child}): buttonTypes = ButtonTypes.outline;

  BoxDecoration getDecoration(BuildContext context){
    final primaryDecoration = BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(radius??_radius),);
    final secondaryDecoration = BoxDecoration(color: ThemeClass.of(context).secondary, borderRadius: BorderRadius.circular(radius??_radius),);
    final outlinedDecoration = BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius??_radius),
        border: Border.all(color: ThemeClass.of(context).lightGrey,width: 1.2.r)
    );

    switch(buttonTypes){
      case ButtonTypes.primary: return primaryDecoration;
      case ButtonTypes.secondary: return secondaryDecoration;
      case ButtonTypes.outline: return outlinedDecoration;
    }
  }

  Color getTitleColor(BuildContext context){
    switch(buttonTypes){
      case ButtonTypes.primary: return Colors.white;
      case ButtonTypes.secondary: return ThemeClass.of(context).shade1;
      case ButtonTypes.outline: return ThemeClass.of(context).pShade1;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius??_radius),
      child: Container(
        width: width,
        height:height ?? 48.h,
        alignment: Alignment.center,
        decoration: getDecoration(context),
        child: child??Text(title??'',style: TextStyleHelper.of(context).body16.copyWith(color: getTitleColor(context)),),
      ),
    );
  }
}