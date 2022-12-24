import 'dart:convert';

import 'package:finalproject/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoragedata extends GetxController {
  setUser(UserModel userModel) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('user', jsonEncode(userModel.toJson()));
  }

  _getUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var val = preferences.getString('user');
    return UserModel.fromJson(jsonDecode(val!));
  }

  Future<UserModel> get getUser async{
      UserModel userModel = await _getUser();
      return userModel;
  }

  removeUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('user');
  }
}