import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/cart_controller.dart';
import '../controller/control_controller.dart';
import '../controller/items_controller.dart';
import '../controller/profile_controller.dart';
import '../repository/local_storage_data.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ControlController());
    Get.lazyPut(() => ItemController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => LocalStoragedata());
    Get.lazyPut(() => ProfileController());

  }
}