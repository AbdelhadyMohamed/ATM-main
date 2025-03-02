import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hypelify/Utilities/theme_helper.dart';
import 'package:provider/provider.dart';

import '../core/Font/font_provider.dart';
class TextStyleHelper{
  final BuildContext context;
  TextStyleHelper._(this.context);

  static TextStyleHelper of(BuildContext context) => TextStyleHelper._(context);

  double get _fSS => Provider.of<FontProvider>(context,listen: false).fontSizeScale;
  FontFamilyTypes get _fF => Provider.of<FontProvider>(context,listen: false).fontFamily;

  _fontFamily(){
    switch(_fF){
      case FontFamilyTypes.alexandria: return GoogleFonts.alexandria;
      case FontFamilyTypes.cairo: return GoogleFonts.cairo;
      case FontFamilyTypes.roboto: return GoogleFonts.roboto;
    }
  }

  TextStyle  getTextStyle({required double fontSize,FontWeight? fontWeight}) =>
      _fontFamily()(fontSize: (fontSize*_fSS).sp,fontWeight: fontWeight,color: ThemeClass.of(context).textColorMain);



  TextStyle get headlineLarge32 => getTextStyle(fontSize: 32);
  TextStyle get headlineLarge32Bold => getTextStyle(fontSize: 32,fontWeight: FontWeight.w600);

  TextStyle get title20 => getTextStyle(fontSize: 20);
  TextStyle get title18 => getTextStyle(fontSize: 18);
  TextStyle get title16 => getTextStyle(fontSize: 16);
  TextStyle get title12 => getTextStyle(fontSize: 12);

  TextStyle get body18 => getTextStyle(fontSize: 18);
  TextStyle get body16 => getTextStyle(fontSize: 16);
  TextStyle get body14 => getTextStyle(fontSize: 14);
  TextStyle get body12 => getTextStyle(fontSize: 12);

  TextStyle get b_14 => getTextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400);
  TextStyle get b_10 => getTextStyle(fontSize: 10.sp,fontWeight: FontWeight.w400);

}