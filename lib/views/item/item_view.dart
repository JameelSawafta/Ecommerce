import 'package:finalproject/model/card_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../controller/one_item_controller.dart';
import '../global_widget/custom_button.dart';
import '../home/home.dart';

class ItemView extends StatelessWidget {
  ItemView({Key? key}) : super(key: key);

  OneItemController oneItemController = Get.put(OneItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Product details', style: TextStyle(color: Color(0xff272833), fontSize: 13)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Color(0xff272833)),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xff272833)),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Image.network('${oneItemController.link}', height: 300, width: 300),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 412,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Text(
                    '${oneItemController.name}',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Text(
                    oneItemController.description!.length > 400
                        ? '${oneItemController.description!.substring(0, 400)}...'
                        : '${oneItemController.description}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Text(
                    '${oneItemController.price}',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xffCC9D76),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xffF7F7F7),
                        ),
                        child: Image.asset('images/icons/Icons-icon-bookmark-filled.png'),
                      ),
                      SizedBox(width: 20),
                      GetBuilder<CartController>(
                        init: CartController(),
                        builder: (controller1) => CustomButton(
                          text: 'Add to cart',
                          width: 200,
                          height: 44,
                          onPressed: () {
                            controller1.addItem(
                              CartItemModel(
                                name: oneItemController.name,
                                price: oneItemController.price,
                                image: oneItemController.link,
                                quantity: 1,
                                id: oneItemController.id,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 44,
                        width: 44,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xffF7F7F7),
                        ),
                        child: Image.asset('images/icons/Icons-icon-share-filled.png'),
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
