import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';
import '../global_widget/custom_item.dart';

class SectionItems extends StatelessWidget {
  const SectionItems({Key? key}) : super(key: key);

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
            title: Text('STORE', style: TextStyle(color: Colors.white, fontSize: 13)),
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
                                Text(
                                  '${Get.arguments['title']}',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                  textAlign: TextAlign.center,
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

                              ],
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: Get.arguments['items'].length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (context, index) {
                              return CustomItem(
                                link: Get.arguments['items'][index].image,
                                name: Get.arguments['items'][index].name,
                                price: Get.arguments['items'][index].price,
                                description: Get.arguments['items'][index].disc,
                                id: Get.arguments['items'][index].id,
                              );
                            },
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
