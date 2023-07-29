import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pingoo_learn_assignment/routes/routes_names.dart';
import 'package:pingoo_learn_assignment/services/auth_service.dart';
import 'package:pingoo_learn_assignment/utils/show_snackbar.dart';

class SignupController extends GetxController {
  final AuthService _service = AuthService();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> signUp() async {
    isLoading = true;
    update();

    final res = await _service.signUp(
      emailController.text,
      passwordController.text,
      nameController.text,
    );

    isLoading = false;
    update();

    if (res) {
      Get.toNamed(RoutesNames.homeScreen);
    } else {
      Utils.showSnackBar(
        "Error",
        "Something went wrong !!!",
        isError: true,
      );
    }
  }
}
