import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_app/adminPages/admin_page.dart';
import 'package:my_app/userPages/user_drawer.dart';

final _NameController = TextEditingController();
final _DesgController = TextEditingController();
final _RGController = TextEditingController();
final _CompController = TextEditingController();
final _phonenoController = TextEditingController();

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final _formkey = GlobalKey<FormState>();
  String? _complaint;

  final user = FirebaseAuth.instance;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  void PushMessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleleapis.com/fcm/send'),
        headers: <String, String>{
          'Content_Type': 'application/json',
          'Authorization':
              'AAAAwOvvb34:APA91bF_5h_baB46WphptfxtwgdszeMXx6HPVs-50ykJk1d0yRRRIB7v8Jqmf83ZJG0cDPZz2yfmcZGjeQeJExNArckfSXhW2s8gKuyBEauX8ePuPTzm4jwnT5D5qf9TApfSOZXYQ3nJ',
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            "notification": <String, dynamic>{
              "title": title,
              "body": body,
              "android_channel_id": "comp"
            },
            "to": token,
          },
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print("error push notification");
      }
    }
  }

  Future submit() async {
    addUserDetails(
        _NameController.text.trim(),
        _phonenoController.text.trim(),
        _DesgController.text.trim(),
        _RGController.text.trim(),
        _CompController.text.trim());
  }

  Future addUserDetails(String name, String phoneno, String designation,
      String resgrp, String complaint) async {
    await FirebaseFirestore.instance.collection('Complaints').add({
      'uid': user.currentUser!.uid,
      'Name': name,
      'Phone Number': phoneno,
      'Designation': designation,
      'Research Group': resgrp,
      'Complaint': complaint,
      'CreatedAt': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Registration'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      drawer: userDrawer(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.5,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Register Here",
                              style: TextStyle(
                                  color: Colors.black,
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _NameController,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      labelText: 'Name',
                                      hintText: 'Enter Name',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Name';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _phonenoController,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      labelText: 'Phone Numer',
                                      hintText: 'Enter Phone Number',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Phone Number';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _DesgController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      labelText: 'Designation',
                                      hintText: 'Enter the designation',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Designation';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _RGController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      labelText: 'Research Group',
                                      hintText: 'Enter the Research Group',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Research Group';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _CompController,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.done,
                                    maxLines: 2,
                                    decoration: const InputDecoration(
                                      labelText: 'Enter your complaint',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your complaint';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _complaint = value;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.pink,
                                        fixedSize: const Size(90, 30),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40))),
                                    onPressed: () async {
                                      if (_formkey.currentState!.validate()) {
                                        _formkey.currentState!.save();
                                        submit();
                                        _showDialog(context);
                                        DocumentSnapshot snap =
                                            await FirebaseFirestore.instance
                                                .collection('AdminTokens')
                                                .doc('Tokens')
                                                .get();
                                        String token = snap['token'];
                                        PushMessage(
                                          token,
                                          'Complaint Registered by',
                                          _NameController.text.trim(),
                                        );
                                      }
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Complaint Submitted'),
        content: const Text('Thank you for submitting your complaint.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _NameController.clear();
              _phonenoController.clear();
              _DesgController.clear();
              _RGController.clear();
              _CompController.clear();
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
