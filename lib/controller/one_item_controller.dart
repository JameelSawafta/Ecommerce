import 'package:get/get.dart';

class OneItemController extends GetxController {

  String? name;
  String? link;
  String? price;
  String? description;
  String? id;


  @override
  void onInit() {
    name = Get.arguments['name'];
    link = Get.arguments['link'];
    price = Get.arguments['price'];
    description = Get.arguments['description'];
    id = Get.arguments['id'];
    super.onInit();
  }

}