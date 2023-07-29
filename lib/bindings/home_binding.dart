import 'package:get/get.dart';
import 'package:pingoo_learn_assignment/controller/home_controlller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
