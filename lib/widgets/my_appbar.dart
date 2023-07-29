import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingoo_learn_assignment/constants/text_style.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size(360.w, 60.h);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 360.w,
      color: Color(0xff0C54BE),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: Row(
          children: [
            Text(
              "MyNews",
              style: MyTextStyle.headingTextStyle.copyWith(color: Colors.white),
            ),
            Spacer(),
            Text(
              "IN",
              style: MyTextStyle.headingTextStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
