import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/IntroScreen/Splashscreen.dart';
import 'package:my_app/userPages/my_complaint.dart';
import 'package:my_app/userPages/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userDrawer extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello,\n${user?.email!}'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.app_registration),
            title: const Text('My Complaints'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => myComp()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () async {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
