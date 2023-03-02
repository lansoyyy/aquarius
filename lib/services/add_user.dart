import 'package:cloud_firestore/cloud_firestore.dart';

Future addUser(firstName, lastName, phone, sizeOfPond, doms) async {
  final docUser = FirebaseFirestore.instance.collection('User').doc();

  final json = {
    'firstName': firstName,
    'lastName': lastName,
    'phone': phone,
    'sizeOfPond': sizeOfPond,
    'doms': doms,
  };

  await docUser.set(json);
}
