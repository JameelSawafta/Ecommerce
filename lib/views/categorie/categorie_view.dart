import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';
import '../global_widget/custom_item.dart';
import '../section/section_items.dart';

class CategorieView extends StatelessWidget {
  CategorieView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(
      init: ItemController(),
      builder: (controller1) => controller1.loading.value
          ? Center(child: CircularProgressIndicator(color: Color(0xffCC9D76),backgroundColor: Colors.white),)
          : Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: const Text('CATEGORIE', style: TextStyle(color: Colors.white, fontSize: 13)),
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
                                    ),const Text(
                                      'Classic Collections',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'Search through more than 1000+ watches',
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
                                            'Limited Edition',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(SectionItems(),
                                                arguments: {
                                                  'title': 'Limited Edition',
                                                  'items': controller1.limitedEdition,
                                                },
                                              );
                                            },
                                            child: Text(
                                              'See all >>',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xffCC9D76),
                                              ),
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
                                    itemCount: controller.limitedEdition.length > 3 ? 3 : controller.limitedEdition.length,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return CustomItem(link: controller.limitedEdition[index].image,name: controller.limitedEdition[index].name,price: controller.limitedEdition[index].price,description: controller.limitedEdition[index].disc, id: controller.limitedEdition[index].id,);
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Anatolian Civilizations Catalog',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(SectionItems(),
                                                arguments: {
                                                  'title': 'Anatolian Civilizations Catalog',
                                                  'items': controller1.anatolianCivilizationsCatalog,
                                                },
                                              );
                                            },
                                            child: Text(
                                              'See all >>',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xffCC9D76),
                                              ),
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
                                    itemCount: controller.anatolianCivilizationsCatalog.length > 3 ? 3 : controller.anatolianCivilizationsCatalog.length,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return CustomItem(link: controller.anatolianCivilizationsCatalog[index].image,name: controller.anatolianCivilizationsCatalog[index].name,price: controller.anatolianCivilizationsCatalog[index].price, description: controller.anatolianCivilizationsCatalog[index].disc, id: controller.anatolianCivilizationsCatalog[index].id,);
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Zevk-i Selim Catalog',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(SectionItems(),
                                                arguments: {
                                                  'title': 'Zevk-i Selim Catalog',
                                                  'items': controller1.zevk,
                                                },
                                              );
                                            },
                                            child: Text(
                                              'See all >>',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xffCC9D76),
                                              ),
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
                                    itemCount: controller.zevk.length > 3 ? 3 : controller.zevk.length,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return CustomItem(link: controller.zevk[index].image,name: controller.zevk[index].name,price: controller.zevk[index].price, description: controller.zevk[index].disc, id: controller.zevk[index].id,);
                                    },
                                  ),
                                ),
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
