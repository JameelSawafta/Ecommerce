import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/auth/login_view.dart';
import '../views/auth/signup_view.dart';
import '../views/home/home.dart';
import 'auth_controller.dart';

class ControlView extends GetWidget<AuthController> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user == null) {
        return LoginView();
      } else {
        return Home();
      }
    });
  }
}
