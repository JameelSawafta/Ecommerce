import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../global_widget/custom_button.dart';
import 'widget/google_facebook.dart';

class SignupView extends GetWidget<AuthController> {
  SignupView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('SIGN UP', style: TextStyle(color: Colors.white, fontSize: 13)),
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
                          'Create your account',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'After your registration is complete,',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          'you can see our opportunity products.',
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
                            onSaved: (value) => controller.name = value,
                            decoration: InputDecoration(
                              hintText: 'Username',
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
                            onSaved: (value) => controller.email = value,
                            decoration: const InputDecoration(
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
                        Container(
                          child: TextFormField(
                            onSaved: (value) => controller.phone = value,
                            decoration: const InputDecoration(
                              hintText: 'Phone',
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
                        CustomButton(
                          width: 240,
                          height: 44,
                          text: 'SIGN UP',
                          onPressed: () {
                            _formKey.currentState!.save();
                            controller.createUserWithEmailAndPassword();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                          height: 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                              onPressed: () {
                                Get.offNamed('/login');
                              },
                              child: const Text('Sign In', style: TextStyle(color: Color(0xffCC9D76))),
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

