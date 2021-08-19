import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:screens/screens/login_page.dart';

import 'package:screens/screens/otp.dart';

import 'package:screens/widgets/build_name.dart';
import 'package:screens/widgets/build_phone.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  bool showLoading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x66745C97),
                  Color(0x99745C97),
                  Color(0xcc745C97),
                  Color(0xff745C97),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                50.heightBox,
                "Create Account".text.size(50).make(),
                40.heightBox,
                BuildName(controller: nameController),
                20.heightBox,
                BuildPhone(
                  controller: phoneController,
                ),
                20.heightBox,
                40.heightBox,
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => OTPScreen(
                            phoneController.text, nameController.text),
                      ));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 6,
                          color: Colors.black26,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: "Sign Up".text.size(25).make(),
                  ),
                ),
                20.heightBox,
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: "Already have an Account?".text.white.make(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
