import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../GoogleSheet/Comp_sheet.dart';
import '../GoogleSheet/fields_sheets.dart';
import 'package:intl/intl.dart';

class GetName extends StatelessWidget {
  final String documentId;

  GetName({required this.documentId});

  final fireStore =
      FirebaseFirestore.instance.collection('Complaints').snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection('Complaints');

  bool valuefirst = false;
  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    final String nam;
    CollectionReference complaints =
        FirebaseFirestore.instance.collection('Complaints');
    return FutureBuilder<DocumentSnapshot>(
      future: complaints.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${data['Name']}\n'
                    'Phone Number: ${data['Phone Number']}\n'
                    'Designation: ${data['Designation']}\n'
                    'Research Group: ${data['Research Group']}\n'
                    'Complaint: ${data['Complaint']}\n'
                    'Created At: ${vikiDate(data['CreatedAt'])}\n'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final comp = compl(
                          name: '${data['Name']}',
                          phoneno: '${data['Phone Number']}',
                          desg: '${data['Designation']}',
                          resg: '${data['Research Group']}',
                          comp: '${data['Complaint']}',
                          created: '${vikiDate(data['CreatedAt'])}',
                          rectify: dateFormat.format(DateTime.now()),
                          remark: 'Rectified',
                        );
                        await compSheet.insert([comp.toJson()]);
                        ref.doc(documentId).delete();
                        _showDialog(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_box,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const Text('Loading....');
      }),
    );
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

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Complaint Rectified'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
