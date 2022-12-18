import 'package:finalproject/model/user_model.dart';
import 'package:finalproject/service/fire_store_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    super.onInit();
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
      }

      );
  }

  void signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
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
            saveUser(user);
      }
      );


       Get.offAllNamed('/home');


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

  void saveUser( UserCredential user) async {
    UserModel userModel = UserModel(
      userId: _auth.currentUser!.uid,
      email: _auth.currentUser!.email,
      username: name,
      phoneNumber: phone,
    );
    await FireStoreUser().addUser(userModel);
  }


  void saveUserGoogle( UserCredential user) async {
    UserModel userModel = UserModel(
      userId: _auth.currentUser!.uid,
      email: _auth.currentUser!.email,
      username: _auth.currentUser!.displayName,
      phoneNumber: phone,
    );
    await FireStoreUser().addUser(userModel);
  }


}