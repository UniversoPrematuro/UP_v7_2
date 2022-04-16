import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Screen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore.instance
      .collection("users")
      .doc("001")
      .set({"nome": "Gabriel"});

  runApp(MaterialApp(
      home: const Login(),
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 239, 121, 91),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromARGB(255, 101, 187, 88),
              secondary: const Color.fromARGB(255, 255, 255, 255)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
            elevation: 20,
            shadowColor: Colors.black,
          )) // Color Scheme
          )));
}
