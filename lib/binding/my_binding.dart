import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/homeController.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());

  }
}