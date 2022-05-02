// ignore_for_file: unnecessary_null_comparison, unused_element

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  // File? _imagem;
  // late String _idLogged;
   bool _statusUpload = false;
  // late String urlRec;

  // Future _recuperarImagem(origemImagem) async {
    
  //   File? imagemSelec;

  //   final ImagePicker _picker = ImagePicker();
  //   switch (origemImagem) {
  //     case "camera":
  //       imagemSelec =
  //           (await _picker.pickImage(source: ImageSource.camera)) as File;
  //       break;
  //     case "galeria":
  //       imagemSelec =
  //           (await _picker.pickImage(source: ImageSource.gallery)) as File;
  //       break;
  //   }
  //   setState(() {
  //     _imagem = imagemSelec;
  //     _uploadImage();
  //   });
  // }

  // Future _uploadImage() async {
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   Reference pastaRaiz = storage.ref();
  //   Reference arquivo = pastaRaiz.child("perfil").child(_idLogged + "jpg");
  //   //upload image
  //   UploadTask task = arquivo.putFile(_imagem!);

  //   //controlar prog
  //   task.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
  //     if (taskSnapshot.state == TaskState.running) {
  //       setState(() {
  //         _statusUpload = true;
  //       });
  //     } else if (taskSnapshot.state == TaskState.success) {
  //       _recuperarImagem(taskSnapshot);
  //       setState(() {
  //         _statusUpload = false;
  //       });
  //     }
  //   });
  // }

  // Future _recuperarURL(TaskSnapshot taskSnapshot) async {
  //   String url = await taskSnapshot.ref.getDownloadURL();
  //   _atualizarUrlImg(url);
  //   setState(() {
  //     urlRec = url;
  //   });
  // }

  // _recuperarDados() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User logged = (auth.currentUser) as User;
  //   _idLogged = logged.uid;

  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   DocumentSnapshot snapshot =
  //       await db.collection("users").doc(_idLogged).get();

  //   Map<String, dynamic>? dados = snapshot.data as Map<String, dynamic>;
  //   _controllerNome.text = dados["nome"];
  //   if (dados["urlImg"] != null) {
  //     urlRec = dados["urlImg"];
  //   }
  // }

  // _atualizarUrlImg(String url) {
  //   FirebaseFirestore db = FirebaseFirestore.instance;

  //   Map<String, dynamic>? dadosAtt = {"urlImg": url};

  //   db.collection("users").doc(_idLogged).update(dadosAtt);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _recuperarDados();
  // }

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
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  child: _statusUpload
                      ? const CircularProgressIndicator()
                      : Container(),
                ),
                // CircleAvatar(
                //     radius: 100,
                //     backgroundColor: Colors.grey,
                //     backgroundImage:
                //         urlRec != null ? NetworkImage(urlRec) : null),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: const Text("Câmera"),
                      onPressed: () {
                        // _recuperarImagem("camera");
                      },
                    ),
                    TextButton(
                      child: const Text("Galeria"),
                      onPressed: () {
                        // _recuperarImagem("galeria");
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
                      // _atualizarNomeFirestore();
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