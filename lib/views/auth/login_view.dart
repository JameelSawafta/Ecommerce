import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../global_widget/custom_button.dart';
import 'widget/google_facebook.dart';

class LoginView extends GetWidget<AuthController>{
  LoginView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('LOG IN', style: TextStyle(color: Colors.white, fontSize: 13)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
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
                physics: const NeverScrollableScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Let\'s sign you in',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Welcome back, you\'ve been missed!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: TextFormField(
                          onSaved: (value) => controller.email = value,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                          onSaved: (value) => controller.password = value,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //remember me checkbox and forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                activeColor: Color(0xffCC9D76),
                                onChanged: (value) {

                                },
                              ),
                              const Text('Remember me'),
                            ],
                          ),
                          const Text('Forgot Password?'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        width: 240,
                        height: 44,
                        text: 'LOG IN',
                        onPressed: () {
                          _formKey.currentState!.save();
                          controller.signInWithEmailAndPassword();
                        },
                      ),
                      SizedBox(
                        height: 75,
                      ),
                      //social media login buttons
                      Column(
                        children: [
                          GoogleOrFacebook(
                            color: Color(0xffC10E0E),
                            text: 'Continue with Google',
                            image: 'images/Icons-icon-google.png',
                            onPressed: () {
                              controller.googleSignIn();
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GoogleOrFacebook(
                            color: Color(0xff3B5998),
                            text: 'Continue with Facebook',
                            image: 'images/Icons-icon-facebook.png',
                            onPressed: () {},
                          ),
                        ],
                      ),
                        SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              Get.offNamed('/signup');
                            },
                            child: const Text('Sign Up', style: TextStyle(color: Color(0xffCC9D76))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}

