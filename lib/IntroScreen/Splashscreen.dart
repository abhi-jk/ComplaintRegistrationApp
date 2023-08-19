import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/adminPages/admin_page.dart';
import 'package:my_app/authorisationPages/login_or_logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

late String finalUserId;

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => splashscreenState();
}

// ignore: camel_case_types
class splashscreenState extends State<splashscreen> {
  static const String KEYLOGIN = "login";

  @override
  void initState() {
    // TODO: implement initState

    wheretoGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const Text(
              'CWRDM-IT',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromARGB(255, 66, 133, 187),
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              'COMPLAINT REGISTRATION',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromARGB(255, 66, 133, 187),
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assests/images/Logo_CWRDM.png',
              alignment: Alignment.center,
              width: 201,
              height: 201,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'ISO 9001-2015',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromARGB(255, 7, 101, 179),
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              'assests/images/govtlogo.png',
              alignment: Alignment.bottomCenter,
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }

  void wheretoGo() async {
    var sharedPef = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPef.getBool(KEYLOGIN);
    Timer(const Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const adminPage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const loginorout()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const loginorout()));
      }
    });
  }
}
