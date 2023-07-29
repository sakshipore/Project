import 'package:get/get.dart';
import 'package:pingoo_learn_assignment/bindings/home_binding.dart';
import 'package:pingoo_learn_assignment/bindings/login_binding.dart';
import 'package:pingoo_learn_assignment/bindings/signup_binding.dart';
import 'package:pingoo_learn_assignment/routes/routes_names.dart';
import 'package:pingoo_learn_assignment/view/home_screen.dart';
import 'package:pingoo_learn_assignment/view/login_screen.dart';
import 'package:pingoo_learn_assignment/view/signup_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesNames.loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesNames.signupScreen,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: RoutesNames.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
