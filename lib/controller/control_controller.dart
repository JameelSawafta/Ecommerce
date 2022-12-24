import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/cart/cart_view.dart';
import '../views/categorie/categorie_view.dart';
import '../views/home/home.dart';
import '../views/settings/settings_view.dart';
import '../views/wishlist/wishlist_view.dart';

class ControlController extends GetxController {
  int _NavIndex = 0;
  Widget _currentView = Home();

  int get navIndex => _NavIndex;

  get currentView => _currentView;

  void setNavIndex(int index) {
    _NavIndex = index;
    switch (index) {
      case 0:
        _currentView = Home();
        break;
      case 1:
        _currentView = CategorieView();
        break;
      case 2:
        _currentView = CartView();
        break;
      case 3:
        _currentView = WishlistView();
        break;
      case 4:
        _currentView = SettingsView();
        break;
    }
    update();
  }
}