import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/adminPages/admin_login.dart';
import 'package:my_app/adminPages/admin_page.dart';

class adminUserRegisterPage extends StatefulWidget {
  const adminUserRegisterPage({super.key});

  @override
  State<adminUserRegisterPage> createState() => _adminUserRegisterPageState();
}

final emailcontroller = TextEditingController();
final passcontroller = TextEditingController();
final confpasscontroller = TextEditingController();

class _adminUserRegisterPageState extends State<adminUserRegisterPage> {
  final formKey = GlobalKey<FormState>();
  bool _isVisible = false;

  Future signUp() async {
    if (passConfirmed()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passcontroller.text.trim());
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('User added Succesfully!!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    } else {
      formKey.currentState!.validate();
    }
  }

  bool passConfirmed() {
    if (passcontroller.text.trim() == confpasscontroller.text.trim()) {
      return true;
    } else {
      return false;
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
                    "Register here",
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
                    height: height * 0.05,
                  ),
                  TextFormField(
                    controller: confpasscontroller,
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
                      labelText: 'Confirm Password',
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
                    onPressed: () {
                      signUp();
                      emailcontroller.clear();
                      passcontroller.clear();
                      confpasscontroller.clear();
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
