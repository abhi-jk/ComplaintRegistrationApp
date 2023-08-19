import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/userPages/Homescreen.dart';
import 'package:my_app/userPages/user_login.dart';

import 'auth_page.dart';

class loginorout extends StatelessWidget {
  const loginorout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const homescreen();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
