import 'package:finalproject/model/user_model.dart';
import 'package:finalproject/service/fire_store_user.dart';
import 'package:finalproject/views/controlView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../repository/local_storage_data.dart';

class AuthController extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  FirebaseAuth _auth = FirebaseAuth.instance;

  String? email;
  String? password;
  String? name;
  String? phone;

  Rx<User?> _user = Rx<User?>(null);
  get user => _user.value?.email;
  get userId => _user.value?.uid;

  final LocalStoragedata _localStoragedata = Get.find();


  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    super.onInit();
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);
    }
  }

  void googleSignIn() async {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      await _auth.signInWithCredential(credential).then((user) async {
        saveUserGoogle(user);
        // Get.offAllNamed('/');
      }

      );
  }

  void signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!).then((value) async{
        await getCurrentUserData(value.user!.uid);
      }
      );
      // Get.offAllNamed('/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('No user found for that email.', 'Try again',
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Wrong password provided for that user.', 'Try again',
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
       await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
            await saveUser(user);
      }
      );
       Get.offAllNamed('/');


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('The password provided is too weak.', 'Try again',
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('The account already exists for that email.', 'Try again',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
    }
  }

  setUser(UserModel userModel) async {
    await _localStoragedata.setUser(userModel);
  }

  saveUser( UserCredential user) async {
    UserModel userModel = UserModel(
      userId: _auth.currentUser!.uid,
      email: _auth.currentUser!.email,
      username: name,
      phoneNumber: phone,
    );
    await FireStoreUser().addUser(userModel);
    await setUser(userModel);
  }


  void saveUserGoogle( UserCredential user) async {
    UserModel userModel = UserModel(
      userId: _auth.currentUser!.uid,
      email: _auth.currentUser!.email,
      username: _auth.currentUser!.displayName,
      phoneNumber: phone,
    );
    await FireStoreUser().addUser(userModel);
    await setUser(userModel);

  }

  getCurrentUserData(String id) async {
    await FireStoreUser().getUser(id).then((value) {
      setUser(UserModel.fromJson(value.data()! as Map<String, dynamic>));
    });
  }



}


