import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/categorie_model.dart';
import '../service/categories_service.dart';

class ItemController extends GetxController {

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;


  List<CategorieModel> _limitedEdition = [];
  List<CategorieModel> _anatolianCivilizationsCatalog = [];
  List<CategorieModel> _zevk = [];
  List<CategorieModel> get limitedEdition => _limitedEdition;
  List<CategorieModel> get anatolianCivilizationsCatalog =>
      _anatolianCivilizationsCatalog;
  List<CategorieModel> get zevk => _zevk;

  List<CategorieModel> _item = [];
  List<CategorieModel> get item => _item;



  ItemController(){
    getCategories();
}

  getCategories() async{
    _loading.value = true;
    return await CategoriesService().getCategories().then((value) {
      for (var i = 0; i < value.length; i++) {
        if((value[i].data()! as Map)['type']  == 'Ottoman Collection Catalog'){
          _limitedEdition.add(CategorieModel.fromJson(value[i].data()! as Map<String, dynamic>)) ;
        }
        if((value[i].data()! as Map)['type']  == 'Anatolian Civilizations Collection Catalog'){
          _anatolianCivilizationsCatalog.add(CategorieModel.fromJson(value[i].data()! as Map<String, dynamic>)) ;
        }
        if((value[i].data()! as Map)['type']  == 'Zevk-i Selim Collection Catalog'){
          _zevk.add(CategorieModel.fromJson(value[i].data()! as Map<String, dynamic>)) ;
        }
        _item.add(CategorieModel.fromJson(value[i].data()! as Map<String, dynamic>)) ;
        _loading.value = false;
      }
      update();
    });
  }



  String? id ;
  String? name;
  String? image;
  String? price;
  String? disc;
  String? type;

  final random = Random();

  String get id0 => id = DateTime.now().millisecondsSinceEpoch.toString() + random.nextInt(100).toString();





  addItem() async{
    _loading.value = true;
    return await CategoriesService().addCategories(CategorieModel(
      id: id0,
      name: name,
      image: "https://firebasestorage.googleapis.com/v0/b/finalproject-a5cf5.appspot.com/o/Rumili_Kase.png?alt=media&token=20fa35e7-32bd-4171-80d9-c23e39bc4cfe",
      price: price,
      disc: disc,
      type: type,
    )).then((value) {
      _loading.value = false;
      update();
    });
  }



}