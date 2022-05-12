// ignore_for_file: unnecessary_null_comparison, unused_element

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:universoprem_v7_2/Classes/perfil_helper.dart';
import 'package:universoprem_v7_2/Classes/register_helper.dart';
import 'package:universoprem_v7_2/Screen/profile.dart';
import '../Screen/login.dart';
import '../Classes/user.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerNomeMae = TextEditingController();
  final TextEditingController _controllerBirth = TextEditingController();
  final TextEditingController _controllerGage = TextEditingController();
  final TextEditingController _controllerGender = TextEditingController();
  
  String? _idLogged;
  String? emailUser;
  String? nome;
  String? nomeMae;
  String? birth;
  String? gender;




   
  _atualizarDados() {
    String? nome = _controllerNome.text;
    String? nomeMae = _controllerNomeMae.text;
    String? birth = _controllerBirth.text;
    String? gender = _controllerGender.text;
    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> dadosAtualizar = {
      "nome da mae": nomeMae,
      "nome": nome,
      "Nascimento": birth,
      "sexo": gender
    };

     db.collection("users").doc(_idLogged).update(dadosAtualizar);
   }

   Future _recuperarDados() async {
     FirebaseAuth auth = FirebaseAuth.instance;
     User usuarioLogado = auth.currentUser!;
     _idLogged = usuarioLogado.uid;

     FirebaseFirestore db = FirebaseFirestore.instance;
     DocumentSnapshot snapshot =
         await db.collection("users").doc(_idLogged).get();

     Map<String, dynamic> dados = snapshot.data() as Map<String, dynamic>;
     _controllerNome.text = dados["nome"];
     _controllerNomeMae.text = dados["nome da mãe"];
     _controllerBirth.text = dados["Data de nasc."];
     _controllerGender.text = dados["Sexo"];

     setState(() {
       emailUser = usuarioLogado.email;
       _atualizarDados();
       _recuperarDados();
       
     });
   }

   Future saveData() async {
     FirebaseAuth auth = FirebaseAuth.instance;
     User usuarioLogado = auth.currentUser!;
     _idLogged = usuarioLogado.uid;

     FirebaseFirestore db = FirebaseFirestore.instance;
     DocumentSnapshot snapshot = await db.collection("users").doc().get();
     Map<String, dynamic> dados = snapshot.data() as Map<String, dynamic>;
     _controllerNome.text = dados["nome"];
     _controllerNomeMae.text = dados["nome da mãe"];
     _controllerBirth.text = dados["Data de nasc."];
     _controllerGender.text = dados["Sexo"];

    //  db.collection("users")
    //  .doc()
    //  .set({perfil.}) as Map<String, dynamic>);
   }


  @override
    void initState() {
      super.initState();
        _atualizarDados();
        _recuperarDados();
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Perfil"),
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 193, 143)),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: const Text("Câmera"),
                      onPressed: () {
                      },
                    ),
                    TextButton(
                      child: const Text("Galeria"),
                      onPressed: () {
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerNome,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 20),
                    /*onChanged: (texto){
                      _atualizarNomeFirestore(texto);
                    },*/
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerNomeMae,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 20),
                    /*onChanged: (texto){
                      _atualizarNomeFirestore(texto);
                    },*/
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome da mãe",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerBirth,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 20),
                    /*onChanged: (texto){
                      _atualizarNomeFirestore(texto);
                    },*/
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Data de nascimento",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerGender,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 20),
                    /*onChanged: (texto){
                      _atualizarNomeFirestore(texto);
                    },*/
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Sexo",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerGage,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 20),
                    /*onChanged: (texto){
                      _atualizarNomeFirestore(texto);
                    },*/
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Idade",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                    child: const Text(
                      "Salvar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      saveData();
                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Profile())));
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        backgroundColor:
                            const Color.fromARGB(255, 101, 187, 88)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}