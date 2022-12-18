import 'package:get/get.dart';

class HomeController extends GetxController {
  int _NavIndex = 0;
  int get navIndex => _NavIndex;

  void setNavIndex(int index) {
    _NavIndex = index;
    update();
  }
}