import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'binding/my_binding.dart';
import 'controller/controlView.dart';
import 'views/auth/login_view.dart';
import 'views/auth/signup_view.dart';
import 'views/home/home.dart';
//import 'middleware/auth_middleware.dart';




SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      initialBinding: MyBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => ControlView(),
          //middlewares: [AuthMiddleware(),],
        ),
        GetPage(
          name: '/signup',
          page: () => SignupView(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginView(),
        ),
        GetPage(
          name: '/home',
          page: () => Home(),
        ),
      ],
    );
  }
}

