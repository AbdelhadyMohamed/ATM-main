import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final List<DropdownMenuItem<T>> items;
  final T? selected;
  final void Function(T?) onChange;
  final String hint;
  final String? Function(dynamic)? validate;
  final double? width, height;

  const CustomDropDownWidget({
    Key? key,
    this.suffixIcon,
    this.prefixIcon,
    this.selected,
    required this.onChange,
    required this.hint,
    this.validate,
    required this.items,
    this.borderColor,
    this.focusedBorderColor,
    this.width,
    this.hintStyle,
    this.borderRadius,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: borderColor ?? const Color(0xff555555), width: .5.w),
      borderRadius: BorderRadius.circular(8.w),
    );
    return SizedBox(
      width: width ?? 360.w,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
        child: ButtonTheme(
          alignedDropdown: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
              side: BorderSide(
                  color: borderColor ?? const Color(0xff555555), width: .5.w)),
          child: DropdownButtonFormField<T>(
            validator: validate,
            iconSize: 0.0,
            value: selected,
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              border: InputBorder.none,
              isDense: false,
              enabled: true,
              enabledBorder: defaultBorder,
              disabledBorder: defaultBorder,
              focusedBorder: defaultBorder,
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(7.r),
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              hintStyle: hintStyle ??
                  TextStyle(color: Colors.grey.shade500, fontSize: 16.sp),
            ),
            items: items,
            onChanged: onChange,
          ),
        ),
      ),
    );
  }
}
