import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Screen/edit_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Perfil extends EditProfile implements User{
  String? nomeMae;
  String? birth;
  String? gage;
  String? gender;

  final _controllerNomeMae = TextEditingController();
  final _controllerBirth = TextEditingController();
  final _controllerGage = TextEditingController();
  final __controllerGender = TextEditingController();
  
  FirebaseFirestore db = FirebaseFirestore.instance;

  
  
  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "nome da mae: ": _controllerNomeMae,
      "data de nasc.: ": _controllerBirth,
      "gage: ": _controllerGage,
      "sexo: ": __controllerGender

    };
    return map;
    
  }
  String? get mae => nomeMae;

  set mae(String? value){
    nomeMae = value;
  }

  String? get nasc => birth;

  set nasc(String? value){
    birth = value;
  }

  String? get age => gage;

  set age(String? value){
    gage = value;
  }

  String? get sexo => gender;

  set sexo(String? value){
    gender = value;
  }

  
}