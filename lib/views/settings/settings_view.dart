import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => controller.loading.value
        ? Center(child: CircularProgressIndicator(color: Color(0xffCC9D76),backgroundColor: Colors.white),)
        :Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('SETTING', style: TextStyle(color: Colors.white, fontSize: 13)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [

              SizedBox(
                height: 50,
              ),
              Text(
                '${controller.userModel.username}',
                style: TextStyle(color: Color(0xff272833), fontSize: 20, ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${controller.userModel.email}',
                style: TextStyle(color: Colors.black, fontSize: 14, ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,

                child: Row(
                  children: [
                    Text(
                      'Order History',
                      style: TextStyle(color: Colors.black, fontSize: 16, ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,

                child: Row(
                  children: [
                    Text(
                      'My Addresses',
                      style: TextStyle(color: Colors.black, fontSize: 16, ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,

                child: Row(
                  children: [
                    Text(
                      'My Cards',
                      style: TextStyle(color: Colors.black, fontSize: 16, ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,

                child: Row(
                  children: [
                    Text(
                      'Vouchers',
                      style: TextStyle(color: Colors.black, fontSize: 16, ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,

                child: Row(
                  children: [
                    Text(
                      'Nearby Stores',
                      style: TextStyle(color: Colors.black, fontSize: 16, ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,

                child: Row(
                  children: [
                    Text(
                      'Latest Articles',
                      style: TextStyle(color: Colors.black, fontSize: 16, ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  controller.signOut();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 50,
                  width: double.infinity,

                  child: Row(
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(color: Colors.black, fontSize: 16, ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
