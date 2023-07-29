import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pingoo_learn_assignment/constants/text_style.dart';
import 'package:pingoo_learn_assignment/controller/signup_controller.dart';
import 'package:pingoo_learn_assignment/routes/routes_names.dart';
import 'package:pingoo_learn_assignment/utils/show_snackbar.dart';
import 'package:pingoo_learn_assignment/widgets/my_button.dart';
import 'package:pingoo_learn_assignment/widgets/my_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F9FD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: GetBuilder<SignupController>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MyNews",
                    style: MyTextStyle.headingTextStyle.copyWith(
                      color: Color(0Xff0C54BE),
                    ),
                  ),
                  SizedBox(height: 200.h),
                  MyTextField(
                    controller: controller.nameController,
                    hintText: "Name",
                  ),
                  SizedBox(height: 20.h),
                  MyTextField(
                    controller: controller.emailController,
                    hintText: "Email",
                  ),
                  SizedBox(height: 20.h),
                  MyTextField(
                    controller: controller.passwordController,
                    hintText: "Password",
                    isObscure: true,
                  ),
                  SizedBox(height: 200.h),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        int length = controller.passwordController.text.length;
                        if (!controller.emailController.text.contains("@")) {
                          Utils.showSnackBar(
                            "Invalid Entry",
                            "Please enter a valid email address",
                            isError: true,
                          );
                        } else if (length < 6) {
                          Utils.showSnackBar(
                            "Invalid Entry",
                            "Please enter password of atleast 6 characters",
                            isError: true,
                          );
                        } else if (controller.nameController.text == "") {
                          Utils.showSnackBar(
                            "Invalid Entry",
                            "Please enter a name",
                            isError: true,
                          );
                        } else {
                          controller.signUp();
                        }
                      },
                      child:
                          GetBuilder<SignupController>(builder: (controller) {
                        return MyButton(
                          text: "Signup",
                          isLoading: controller.isLoading,
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: MyTextStyle.mediumTextStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesNames.loginScreen);
                        },
                        child: Text(
                          " Login",
                          style: MyTextStyle.mediumTextStyle.copyWith(
                            color: Color(0xff0C54BE),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
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
