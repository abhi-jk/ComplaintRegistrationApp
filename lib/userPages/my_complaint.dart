import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../adminPages/admin_drawer.dart';
import '../adminPages/get_data.dart';
import 'package:intl/intl.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class myComp extends StatefulWidget {
  const myComp({super.key});

  @override
  State<myComp> createState() => myCompState();
}

class myCompState extends State<myComp> {
  //const  adminPage({super.key});

  final user = FirebaseAuth.instance;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    return Scaffold(
      appBar: AppBar(title: const Text('Complaints')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Complaints')
                    .where('uid', isEqualTo: user.currentUser!.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          var data = snapshot.data!.docs[i];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              title: Text('uid: ${data['uid']}\n'
                                  'Name: ${data['Name']}\n'
                                  'Phone Number: ${data['Phone Number']}\n'
                                  'Designation: ${data['Designation']}\n'
                                  'Research Group: ${data['Research Group']}\n'
                                  'Complaint: ${data['Complaint']}\n'
                                  'Created At: ${vikiDate(data['CreatedAt'])}\n'),
                              dense: true,
                              visualDensity: const VisualDensity(vertical: 4),
                              tileColor: Colors.blue[200],
                              onTap: () {},
                            ),
                          );
                        });
                  }
                  return const Text('Loading.....');
                })
          ],
        ),
      ),
    );
  }
}

DateTime? vikiDate(dynamic dateValue) {
  if (dateValue is DateTime) {
    return dateValue;
  } else if (dateValue is String) {
    return DateTime.parse(dateValue);
  } else if (dateValue is Timestamp) {
    return dateValue.toDate();
  } else {
    return null;
  }
}
