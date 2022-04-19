import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:universoprem_v7_2/Screen/home.dart';
import 'Screen/home.dart';
import 'Screen/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore.instance.collection("users").doc().set({});

  runApp(MaterialApp(
      home: const Home(),
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 239, 121, 91),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromARGB(255, 101, 187, 88),
              secondary: const Color.fromARGB(255, 255, 255, 255)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
            elevation: 20,
            shadowColor: Colors.black,
          ) // Style From
              ) // Color Scheme

          )));
}
