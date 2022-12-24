import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';
import '../global_widget/custom_button.dart';
import 'admin_view.dart';

class NewItemView extends StatelessWidget {
  NewItemView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(
      init: ItemController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('NEW ITEM',
                style: TextStyle(color: Colors.white, fontSize: 13)),
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                              child: TextFormField(
                                onSaved: (value) => controller.name = value,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                              child: TextFormField(
                                onSaved: (value) => controller.price = value,

                                decoration: const InputDecoration(
                                  labelText: 'Price',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                              child: TextFormField(
                                onSaved: (value) => controller.disc = value,
                                decoration: const InputDecoration(
                                  labelText: 'Description',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                              child: TextFormField(
                                onSaved: (value) => controller.type = value,
                                decoration: const InputDecoration(
                                  labelText: 'Type',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              width: 200,
                              height: 50,
                              text: 'Add Image',
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              width: 200,
                              height: 50,
                              text: 'Submit',
                              onPressed: () {
                                _formKey.currentState!.save();
                                controller.id0;
                                controller.addItem();
                                Get.back();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  )
              )
            ],
          )
      ),
    );;
  }
}
