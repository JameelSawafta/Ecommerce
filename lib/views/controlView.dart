import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'admin/admin_view.dart';
import 'auth/login_view.dart';
import '../controller/auth_controller.dart';
import '../controller/control_controller.dart';

class ControlView extends GetWidget<AuthController> {
  ControlView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.userId == '3itJvCSQnKMPlXzKQ2BCQh5n9po1'){
        return AdminView();
      }
      else if (controller.user == null) {
        return LoginView();
      } else {
        return GetBuilder<ControlController>(
          init: ControlController(),
          builder: (controller) => Scaffold(
            body: controller.currentView,
            bottomNavigationBar: bottomNavigationBar(),
          ),
        );
      }
    });
  }
  Widget bottomNavigationBar() {
    return GetBuilder<ControlController>(
      init: ControlController(),
      builder: (controller) => BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: controller.navIndex,
        onTap: (index) {
          controller.setNavIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/icons/Icons-icon-home.png', width: 20, height: 20),
            label: 'Store',
            activeIcon: Image.asset('images/active_icons/Icons-icon-home.png', width: 20, height: 20),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icons/Symbols.png', width: 20, height: 20),
            label: 'Categories',
            activeIcon: Image.asset('images/active_icons/Symbols.png', width: 20, height: 20),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icons/Icons-icon-shopping-bag.png', width: 20, height: 20),
            label: 'Cart',
            activeIcon: Image.asset('images/active_icons/Icons-icon-shopping-bag.png', width: 20, height: 20),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icons/Icons-icon-bookmark.png', width: 20, height: 20),
            label: 'Wishlist',
            activeIcon: Image.asset('images/active_icons/Icons-icon-bookmark.png', width: 20, height: 20),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icons/Icons-icon-settings.png', width: 20, height: 20),
            label: 'Settings',
            activeIcon: Image.asset('images/active_icons/Icons-icon-settings.png', width: 20, height: 20),
          ),
        ],

      ),
    );
  }

}
