import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextStyle {
  static const String poppinsFont = "Poppins";

  static TextStyle get regularTextStyle => TextStyle(
        fontFamily: poppinsFont,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: Color(0xff303F60),
      );

  static TextStyle get mediumTextStyle => TextStyle(
    fontFamily: poppinsFont, 
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: Color(0xff303F60),
  );

  static TextStyle get headingTextStyle => TextStyle(
        fontFamily: poppinsFont,
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
      );
}
