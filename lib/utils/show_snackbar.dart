import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showSnackBar(String title, String subTitle,
      {bool isError = false}) {
    Get.snackbar(
      title,
      subTitle,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Colors.red[300] : Colors.green[300],
      colorText: Colors.white,
    );
  }
}
