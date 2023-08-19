import 'package:flutter/material.dart';
import 'package:my_app/userPages/Homescreen.dart';
import 'package:my_app/IntroScreen/Splashscreen.dart';
import 'package:my_app/adminPages/admin_user_reg_page.dart';
import 'package:my_app/userPages/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_login.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Hello Admin'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Add new user'),
            onTap: () async {
              var sharedPef = await SharedPreferences.getInstance();
              sharedPef.setBool(splashscreenState.KEYLOGIN, false);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          adminUserRegisterPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () async {
              var sharedPef = await SharedPreferences.getInstance();
              sharedPef.setBool(splashscreenState.KEYLOGIN, false);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => adminLogin()));
            },
          ),
        ],
      ),
    );
  }
}
