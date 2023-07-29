import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingoo_learn_assignment/constants/text_style.dart';

class MyButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  const MyButton({super.key, required this.text, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 180.w,
      decoration: BoxDecoration(
        color: Color(0xff0C54BE),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
            : Text(
                text,
                style: MyTextStyle.regularTextStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
