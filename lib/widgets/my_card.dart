import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingoo_learn_assignment/constants/text_style.dart';
import 'package:pingoo_learn_assignment/model/article.dart';

class MyCard extends StatelessWidget {
  final Article article;
  const MyCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 135.h,
          width: 320.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.source.name,
                      style: MyTextStyle.regularTextStyle
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 200.w,
                      height: 63.h,
                      child: Text(
                        article.title,
                        style: MyTextStyle.regularTextStyle,
                      ),
                    ),
                    Spacer(),
                    Text(
                      article.publishedDate,
                      style: MyTextStyle.regularTextStyle
                          .copyWith(color: Color(0xffCED3DC)),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      article.urlToImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(child: Text("No Image"));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
