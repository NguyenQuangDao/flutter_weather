// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class DataBaseMethods {
//   Future addUserDetails(Map<String, dynamic> userInfoMap) async {
//     return FirebaseFirestore.instance
//         .collection('users')
//         .doc()
//         .set(userInfoMap);
//   }

//   List<String> docIDs = [];
//   Future searchUserDetails() async {
//     try {
//       return FirebaseFirestore.instance
//           .collection('users')
//           .orderBy('Text', descending: true)
//           .where('Text', isEqualTo: 'dao')
//           .get()
//           .then((snapshot) => snapshot.docs.forEach((element) {
//                 docIDs.add(element.id);
//               }));
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   void printDocIDs() {
//     print(docIDs);
//   }
// }

// // ignore: must_be_immutable
// class GetUserDetails extends StatelessWidget {
//   GetUserDetails({super.key, required this.documentId});
//   String documentId;
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder: ((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           print(data);
//           return Text('Full Name: ${data["Text"]}');
//         }
//         return const Text('Loading...');
//       }),
//     );
//   }
// }
