import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'IntroScreen/Splashscreen.dart';
import 'GoogleSheet/Comp_sheet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await compSheet.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff2470c7),
        fontFamily: 'OpenSans',
      ),
      home: const splashscreen(),
    );
  }
}
