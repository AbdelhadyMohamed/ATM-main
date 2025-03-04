import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscure;
  final bool? readOnly;
  final String? hint;
  final Color? backGroundColor,focusedBorder;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxLine;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? enable, isDense,tapOutside;
  final Color? borderColor;
  final double? borderRadiusValue, width,height;
  final EdgeInsets? insidePadding;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon, suffixIcon;
  final void Function(String)? onchange;
  final Function()? onSuffixTap;
  final int? maxLength;
  final void Function(String?)?  onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;

  const CustomTextFieldWidget({
    Key? key,
    this.isDense,
    this.textAlign,
    this.style,
    this.onchange,
    this.onFieldSubmitted,
    this.textInputAction,
    this.insidePadding,
    this.validator,
    this.maxLine,
    this.hint,
    this.backGroundColor,
    this.controller,
    this.obscure = false,
    this.enable = true,
    this.tapOutside = true,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    this.borderColor,
    this.borderRadiusValue,
    this.prefixIcon,
    this.width,
    this.height,
    this.hintStyle,
    this.suffixIcon,
    this.onSuffixTap,
    this.maxLength,
    this.inputFormatters, this.focusedBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height  ?? 75.h,
      width: width ?? 350.w,
      child: TextFormField(
        onTapOutside: (_)=> (tapOutside== null || tapOutside == false )?FocusManager.instance.primaryFocus?.unfocus():null,
        onSaved:onFieldSubmitted ,
        maxLength: maxLength,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: inputFormatters,
        readOnly: readOnly ?? false,
        textAlignVertical: TextAlignVertical.center,
        textAlign: textAlign ?? TextAlign.right,
        validator: validator,
        enabled: enable,
        obscureText: obscure ?? false,
        controller: controller,
        decoration: InputDecoration(
          errorStyle:  TextStyle(
            // height: 0
            color: Theme.of(context).colorScheme.error,),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue ?? 8.w),
              borderSide: BorderSide(color: borderColor ?? const Color(0xff555555))),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue ?? 8.w),
              borderSide: BorderSide(color: borderColor ?? const Color(0xff555555))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue ?? 8.w),
              borderSide:  BorderSide(color:focusedBorder?? Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue ?? 8.w),
              borderSide:
              BorderSide(color: borderColor ?? const Color(0xff555555))),
          isDense: isDense ?? false,
          prefixIconConstraints: BoxConstraints(minWidth: prefixIcon == null ? 0 : 50.w, maxHeight: 50.w),
          suffixIconConstraints: BoxConstraints(minWidth: suffixIcon == null ? 0 : 35.w, maxHeight: 50.w),
          contentPadding: insidePadding ?? EdgeInsets.symmetric(vertical: 20.w,horizontal: 5.w),
          fillColor: backGroundColor,
          filled: backGroundColor != null,
          hintText: hint,
          prefixIcon: prefixIcon == null ? SizedBox(width: 10.w,) : SizedBox( child: prefixIcon),
          suffixIcon: suffixIcon == null ? SizedBox(width: 5.w,) : InkWell(
            onTap: onSuffixTap,
            child: SizedBox(width: 50.w, child: suffixIcon),
          ),
          hintStyle: hintStyle ?? TextStyle(
            fontSize: 14.sp,
            color: const Color.fromRGBO(168, 168, 168, 1),
          ),
        ),
        onChanged: onchange,
        // textCapitalization: TextCapitalization.words,
        maxLines: maxLine ?? 1,
        keyboardType: textInputType,
        style: style ?? TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}