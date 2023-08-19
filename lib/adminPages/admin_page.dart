import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'admin_drawer.dart';
import 'get_data.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class adminPage extends StatefulWidget {
  const adminPage({super.key});

  @override
  State<adminPage> createState() => adminPageState();
}

class adminPageState extends State<adminPage> {
  //const  adminPage({super.key});
  String? mtoken = '';

  List<String> docIDs = [];

  Future getdocID() async {
    await FirebaseFirestore.instance
        .collection('Complaints')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complaints')),
      drawer: const AdminDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: FutureBuilder(
              future: getdocID(),
              builder: (context, snapshot) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemExtent: 200.0,
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          title: GetName(
                            documentId: docIDs[index],
                          ),
                          dense: true,
                          visualDensity: const VisualDensity(vertical: 4),
                          tileColor: Colors.blue[200],
                          onTap: () {},
                        ),
                      );
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
