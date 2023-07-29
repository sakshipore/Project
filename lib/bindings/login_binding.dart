import 'package:get/get.dart';
import 'package:pingoo_learn_assignment/controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
