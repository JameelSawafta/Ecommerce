
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/control_controller.dart';
import '../../controller/items_controller.dart';
import '../global_widget/custom_item.dart';



class Home extends StatelessWidget {


  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(
      init: ItemController(),
      builder:(controller1) => controller1.loading.value
          ? Center(child: CircularProgressIndicator(color: Color(0xffCC9D76),backgroundColor: Colors.white),)
          : Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text('STORE', style: TextStyle(color: Colors.white, fontSize: 13)),
              centerTitle: true,
              elevation: 0,
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
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Ottoman Collection',
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Find the perfect watch for your wrist',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Categories',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 213.5,
                              child: GetBuilder<ItemController>(
                                builder: (controller) => ListView.builder(
                                  itemCount: controller.item.length > 3 ? 3 : controller.item.length ?? 0,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CustomItem(link: controller.item[index]!.image,name: controller.item[index]!.name,price: controller.item[index]!.price,description: controller.item[index]!.disc , id: controller.item[index]!.id);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Featured Products',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 213.5,
                                  child: GetBuilder<ItemController>(
                                    builder: (controller) => ListView.builder(
                                      itemCount: controller.anatolianCivilizationsCatalog.length > 3 ? 3 : controller.anatolianCivilizationsCatalog.length ?? 0,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return CustomItem(link: controller.anatolianCivilizationsCatalog[index]!.image,name: controller.anatolianCivilizationsCatalog[index]!.name,price: controller.anatolianCivilizationsCatalog[index]!.price,description: controller.anatolianCivilizationsCatalog[index]!.disc, id: controller.anatolianCivilizationsCatalog[index]!.id);
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 213.5,
                                  child: GetBuilder<ItemController>(
                                    builder: (controller) => ListView.builder(
                                      itemCount: controller.zevk.length > 3 ? 3 : controller.zevk.length ?? 0,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return CustomItem(link: controller.zevk[index]!.image,name: controller.zevk[index]!.name,price: controller.zevk[index]!.price, description: controller.zevk[index]!.disc, id: controller.zevk[index]!.id);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    )
                )
              ],
            )

          ),
    );
  }


}

