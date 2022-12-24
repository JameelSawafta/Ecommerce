import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/categorie_model.dart';

class CategoriesService {

  final CollectionReference _itemCollection =
    FirebaseFirestore.instance.collection('Categorie');

  Future<List<QueryDocumentSnapshot>> getCategories() async{
    return await _itemCollection.get().then((value) {
      return value.docs;
    });
  }

  Future<DocumentReference<Object?>> addCategories(CategorieModel categorieModel) async{
    return await _itemCollection.add(categorieModel.toJson());
  }
}