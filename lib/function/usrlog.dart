import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> usrLOG(String uid, String page) async {
  await FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .collection("log")
      .doc()
      .set({'DateTime': Timestamp.now(), 'Page': page});
}
