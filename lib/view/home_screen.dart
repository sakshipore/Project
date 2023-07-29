import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pingoo_learn_assignment/constants/text_style.dart';
import 'package:pingoo_learn_assignment/widgets/my_appbar.dart';
import 'package:pingoo_learn_assignment/widgets/my_card.dart';

import '../controller/home_controlller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    await homeController.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FD),
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: GetBuilder<HomeController>(builder: (controller) {
              return controller.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff0C54BE),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top Headlines",
                          style: MyTextStyle.regularTextStyle
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.articles.length,
                          itemBuilder: (context, index) {
                            return MyCard(article: controller.articles[index]);
                          },
                        ),
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
