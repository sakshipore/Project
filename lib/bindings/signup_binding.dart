import 'package:get/get.dart';
import 'package:pingoo_learn_assignment/controller/signup_controller.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}
