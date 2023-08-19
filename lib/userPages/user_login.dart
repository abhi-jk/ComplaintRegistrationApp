// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:my_app/userPages/Homescreen.dart';
import 'package:my_app/IntroScreen/Splashscreen.dart';
import 'package:my_app/adminPages/admin_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forgot_pass.dart';

class userLogin extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const userLogin({Key? key, required this.showRegisterPage}) : super(key: key);
  @override
  _userLoginState createState() => _userLoginState();
}

final emailcontroller = TextEditingController();
final passcontroller = TextEditingController();

class _userLoginState extends State<userLogin> {
  bool _isVisible = false;
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";

  Future signIn() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passcontroller.text.trim(),
      );
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color.fromARGB(255, 151, 216, 238),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.04),
                  const Text(
                    "User Login",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter correct email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    controller: passcontroller,
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      //  if (value!.isEmpty) {
                      return 'Please enter correct  password';
                      //  }
                      //   return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ForgotPassPage();
                            }));
                          },
                          child: const Text(
                            'Forgot Pasword?',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        fixedSize: const Size(90, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {
                      signIn();
                      emailcontroller.clear();
                      passcontroller.clear();
                    },
                    child: const Text('Login'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "New User ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          TextButton(
                              onPressed: () {
                                widget.showRegisterPage();
                              },
                              child: const Text(
                                "Register",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 16),
                              ),
                              style: TextButton.styleFrom(
                                  fixedSize: Size(90, 80))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => adminLogin()));
                              },
                              child: const Text(
                                "Admin Login",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 18),
                              ),
                              style: TextButton.styleFrom(
                                  fixedSize: Size(150, 100))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
