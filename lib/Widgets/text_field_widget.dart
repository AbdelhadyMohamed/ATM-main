import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';
import 'custom_textfield_widget.dart';

class TextFieldWidget extends StatefulWidget {
  final String hint;
  final Widget? suffixIconWidget,prefixIcon;
  final TextEditingController controller;
  final bool secure,enable,tapOutside;
  final int? maxLength;
  final Color? color;
  final double? height;
  final TextInputType? textInputType;
  final String? Function(String?)? validate,onChange;
  final EdgeInsets? insidePadding;
  const TextFieldWidget({Key? key,
    this.enable=true,required this.hint, required this.controller,this.insidePadding,
    this.suffixIconWidget, this.secure = false,this.tapOutside = false, this.validate, this.prefixIcon,  this.textInputType, this.onChange, this.maxLength, this.color, this.height}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFieldWidget(
      controller: widget.controller,
      hint: widget.hint,
      obscure: widget.secure,
      tapOutside: widget.tapOutside,
      borderRadiusValue: 6.r,
      textInputType: widget.textInputType,
      // height: 50.h,

      maxLength:widget.maxLength,
      onchange:widget.onChange,
      borderColor: const Color(0x2D2A260F),
      hintStyle: TextStyle(fontSize: 14.sp,color: ThemeClass.of(context).medGrey,fontWeight: FontWeight.w400),
      style: TextStyleHelper.of(context).body16,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIconWidget,
      validator: widget.validate,
      backGroundColor: widget.color,
      insidePadding: widget.insidePadding,
        enable:widget.enable,
      height: widget.height,
    );
  }
}