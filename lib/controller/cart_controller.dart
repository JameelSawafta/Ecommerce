import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/card_item_model.dart';
import '../repository/sql_helper.dart';

class CartController extends GetxController {

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartItemModel> _cartItemModel = [];
  List<CartItemModel> get cartItemModel => _cartItemModel;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;


  CartController(){
    getAllItems();
  }

  addItem(CartItemModel cartItemModel) async {
    _loading.value = true;
    for(int i = 0; i < _cartItemModel.length; i++){
      if(_cartItemModel[i].id == cartItemModel.id){
        return;
      }
    }
    await SqlHelper().insertData(cartItemModel);
    _cartItemModel.add(cartItemModel);
    _totalPrice += double.parse(cartItemModel.price!.substring(1)) * cartItemModel.quantity!;
    _loading.value = false;
    update();
  }

  getAllItems() async {
    _loading.value = true;
    _cartItemModel = await SqlHelper().getAllItems();
    getTotalPrice();
    _loading.value = false;
    update();
  }

  getTotalPrice(){
    for(int i = 0; i < _cartItemModel.length; i++){
      _totalPrice += double.parse(_cartItemModel[i].price!.substring(1)) * _cartItemModel[i].quantity!;
    }
    update();
  }

  increaseQuantity(int index) async {
    _cartItemModel[index].quantity = _cartItemModel[index].quantity! + 1;
    _totalPrice += double.parse(_cartItemModel[index].price!.substring(1));
    await SqlHelper().updateData(_cartItemModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if(_cartItemModel[index].quantity! > 1){
      _cartItemModel[index].quantity = _cartItemModel[index].quantity! - 1;
      _totalPrice -= double.parse(_cartItemModel[index].price!.substring(1));
      await SqlHelper().updateData(_cartItemModel[index]);
    }
    update();
  }

  deleteItem(int index) async {
    _totalPrice -= double.parse(_cartItemModel[index].price!.substring(1)) * _cartItemModel[index].quantity!;
    await SqlHelper().deleteData(_cartItemModel[index]);
    _cartItemModel.removeAt(index);
    update();
  }
}