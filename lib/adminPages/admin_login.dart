import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:my_app/IntroScreen/Splashscreen.dart';
import 'package:my_app/adminPages/admin_page.dart';
import 'package:my_app/adminPages/admin_user_reg_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class adminLogin extends StatefulWidget {
  @override
  _adminLoginState createState() => _adminLoginState();
}

final useridcontroller = TextEditingController();
final passcontroller = TextEditingController();

class _adminLoginState extends State<adminLogin> {
  final _formkey = GlobalKey<FormState>();
  bool _isVisible = false;
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
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
                    "Admin Login",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    controller: useridcontroller,
                    decoration: const InputDecoration(
                      labelText: 'User ID',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter correct user id';
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
                    height: height * 0.05,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        fixedSize: const Size(90, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () async {
                      var sharedPef = await SharedPreferences.getInstance();
                      sharedPef.setBool(splashscreenState.KEYLOGIN, true);
                      if (useridcontroller != null &&
                          useridcontroller.text == 'cwrdm@admin' &&
                          passcontroller != null &&
                          passcontroller.text == 'isflan@dmin') {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    adminPage()));
                      } else if (passcontroller.text != 'isflan@dmin') {
                        formKey.currentState!.validate();
                      }
                      useridcontroller.clear();
                      passcontroller.clear();
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
