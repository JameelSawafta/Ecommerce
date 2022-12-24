import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';
import '../../controller/profile_controller.dart';
import '../global_widget/custom_item.dart';
import 'new_item-view.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(NewItemView());
          },
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('ADMIN',
              style: TextStyle(color: Colors.white, fontSize: 13)),
          centerTitle: true,
          elevation: 0,
          actions: [
            GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (cont) => IconButton(
                onPressed: () {
                  cont.signOut();
                },
                icon: const Icon(Icons.logout),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
                  // padding: const EdgeInsets.all(20),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                          Container(
                            child: GetBuilder<ItemController>(
                              init: ItemController(),
                              builder: (controller) => GridView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.item.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                                ),
                                itemBuilder: (context, index) {
                                  return CustomItem(link: controller.item[index]!.image,name: controller.item[index]!.name,price: controller.item[index]!.price,description: controller.item[index]!.disc , id: controller.item[index]!.id);
                                },
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                )
            )
          ],
        )
    );
  }
}
