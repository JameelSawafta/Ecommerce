import 'package:finalproject/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../repository/local_storage_data.dart';
import '../repository/sql_helper.dart';


class ProfileController extends GetxController {

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  final LocalStoragedata _localStoragedata = Get.find();

  UserModel? _userModel;
  UserModel get userModel => _userModel!;



  @override
  void onInit() async {

    super.onInit();
    _loading.value = true;
    await getCurrentUser();
    _loading.value = false;
  }


  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await _localStoragedata.removeUser();
    await SqlHelper().deleteAllData();
  }

  getCurrentUser() async {
    _loading.value = true;
    await _localStoragedata.getUser.then((value) => _userModel = value);

    update();_loading.value = false;
  }

}