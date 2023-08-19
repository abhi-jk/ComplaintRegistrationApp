// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final emailcontroller = TextEditingController();
final passcontroller = TextEditingController();
final confpasscontroller = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  bool _isVisible = false;

  Future signUp() async {
    try {
      if (passConfirmed()) {
        if (emailcontroller.text == 'rasheed@cwrdm.org' ||
            emailcontroller.text == 'razak@cwrdm.org' ||
            emailcontroller.text == 'ajeeshnp@cwrdm.org' ||
            emailcontroller.text == 'allitp@cwrdm.org' ||
            emailcontroller.text == 'ambili@cwrdm.org' ||
            emailcontroller.text == 'anila@cwrdm.org' ||
            emailcontroller.text == 'anjumolekg@cwrdm.org' ||
            emailcontroller.text == 'anu@cwrdm.org' ||
            emailcontroller.text == 'arun@cwrdm.org' ||
            emailcontroller.text == 'ashispc@cwrdm.org' ||
            emailcontroller.text == 'aswathi@cwrdm.org' ||
            emailcontroller.text == 'vmb@cwrdm.org' ||
            emailcontroller.text == 'basil@cwrdm.org' ||
            emailcontroller.text == 'bindu@cwrdm.org' ||
            emailcontroller.text == 'bineesha@cwrdm.org' ||
            emailcontroller.text == 'celine@cwrdm.org' ||
            emailcontroller.text == 'admin@cwrdm.org' ||
            emailcontroller.text == 'chk@cwrdm.org' ||
            emailcontroller.text == 'vkc@cwrdm.org' ||
            emailcontroller.text == 'chinni@cwrdm.org' ||
            emailcontroller.text == 'dalish@cwrdm.org' ||
            emailcontroller.text == 'dawn@cwrdm.org' ||
            emailcontroller.text == 'dharmarajan@cwrdm.org' ||
            emailcontroller.text == 'digila@cwrdm.org' ||
            emailcontroller.text == 'dinesh@cwrdm.org' ||
            emailcontroller.text == 'dinil@cwrdm.org' ||
            emailcontroller.text == 'dsc@cwrdm.org' ||
            emailcontroller.text == 'dipu@cwrdm.org' ||
            emailcontroller.text == 'drissia@cwrdm.org' ||
            emailcontroller.text == 'febin@cwrdm.org' ||
            emailcontroller.text == 'pmh@cwrdm.org' ||
            emailcontroller.text == 'hps@cwrdm.org' ||
            emailcontroller.text == 'ihjas@cwrdm.org' ||
            emailcontroller.text == 'jainet@cwrdm.org' ||
            emailcontroller.text == 'jkk@cwrdm.org' ||
            emailcontroller.text == 'liji@cwrdm.org' ||
            emailcontroller.text == 'mamukoya@cwrdm.org' ||
            emailcontroller.text == 'mp@cwrdm.org' ||
            emailcontroller.text == 'manoj@cwrdm.org' ||
            emailcontroller.text == 'mohamed@cwrdm.org' ||
            emailcontroller.text == 'naveenak@cwrdm.org' ||
            emailcontroller.text == 'neema@cwrdm.org' ||
            emailcontroller.text == 'nkk@cwrdm.org' ||
            emailcontroller.text == 'nisha@cwrdm.org' ||
            emailcontroller.text == 'nithiyas@cwrdm.org' ||
            emailcontroller.text == 'psarathi@cwrdm.org' ||
            emailcontroller.text == 'pradeepan@cwrdm.org' ||
            emailcontroller.text == 'prajith@cwrdm.org' ||
            emailcontroller.text == 'pnv@cwrdm.org' ||
            emailcontroller.text == 'prm@cwrdm.org' ||
            emailcontroller.text == 'prasanth@cwrdm.org' ||
            emailcontroller.text == 'priju@cwrdm.org' ||
            emailcontroller.text == 'praj@cwrdm.org' ||
            emailcontroller.text == 'rajina@cwrdm.org' ||
            emailcontroller.text == 'remak@cwrdm.org' ||
            emailcontroller.text == 'renjith@cwrdm.org' ||
            emailcontroller.text == 'rtr@cwrdm.org' ||
            emailcontroller.text == 'scj@cwrdm.org' ||
            emailcontroller.text == 'santhosh@cwrdm.org' ||
            emailcontroller.text == 'sp@cwrdm.org' ||
            emailcontroller.text == 'spalli@cwrdm.org' ||
            emailcontroller.text == 'sasikumar@cwrdm.org' ||
            emailcontroller.text == 'shabeer@cwrdm.org' ||
            emailcontroller.text == 'shiji@cwrdm.org' ||
            emailcontroller.text == 'siju@cwrdm.org' ||
            emailcontroller.text == 'sid@cwrdm.org' ||
            emailcontroller.text == 'sivanandan@cwrdm.org' ||
            emailcontroller.text == 'smitha@cwrdm.org' ||
            emailcontroller.text == 'smithavs@cwrdm.org' ||
            emailcontroller.text == 'sruthi@cwrdm.org' ||
            emailcontroller.text == 'sudheesh@cwrdm.org' ||
            emailcontroller.text == 'suren@cwrdm.org' ||
            emailcontroller.text == 'thenmozhi@cwrdm.org' ||
            emailcontroller.text == 'usman@cwrdm.org' ||
            emailcontroller.text == 'venu@cwrdm.org' ||
            emailcontroller.text == 'vijaypaloth@cwrdm.org' ||
            emailcontroller.text == 'vijithap@cwrdm.org' ||
            emailcontroller.text == 'vimala@cwrdm.org' ||
            emailcontroller.text == 'vishnumk@cwrdm.org' ||
            emailcontroller.text == 'vishnudas@cwrdm.org' ||
            emailcontroller.text == 'vivek@cwrdm.org' ||
            emailcontroller.text == 'zen@cwrdm.org') {
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

          Navigator.of(context).pop();
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text('Cannot register this user'),
                );
              });
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text('Passwords are not matching'),
              );
            });
      }
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
                    "Hello,",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
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
                      //if (value!.isEmpty) {
                      return 'Please enter correct email';
                      // }
                      //return null;
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
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "I am a User!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          TextButton(
                              onPressed: () {
                                widget.showLoginPage();
                              },
                              child: const Text(
                                "Login",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 18),
                              ),
                              style: TextButton.styleFrom(
                                  fixedSize: Size(65, 80))),
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
