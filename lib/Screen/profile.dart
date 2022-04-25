// ignore_for_file: unused_field

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerNomeMae = TextEditingController();
  final TextEditingController _controllerBirth = TextEditingController();
  final TextEditingController _controllerGage = TextEditingController();
  final TextEditingController _controllerGender = TextEditingController();
  final TextEditingController _controllerUser = TextEditingController();

  late File _imagem;
  late String _idUsuarioLogado;
  bool _subindoImagem = false;
  String? _urlImagemRecuperada;

  Future _recuperarImagem(String origemImagem) async {
    final ImagePicker _picker = ImagePicker();

    File? imagemSelecionada;
    switch (origemImagem) {
      case "camera":
        imagemSelecionada =
            (await _picker.pickImage(source: ImageSource.camera) as File);
        break;
      case "galeria":
        imagemSelecionada =
            (await _picker.pickImage(source: ImageSource.gallery)) as File;
        break;
    }

    setState(() {
      _imagem = imagemSelecionada!;
      if (_imagem != null) {
        _subindoImagem = true;
        _uploadImagem();
      }
    });
  }

  Future _uploadImagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo =
        pastaRaiz.child("perfil").child(_idUsuarioLogado + ".jpg");

    //Upload da imagem
    UploadTask task = arquivo.putFile(_imagem);

    //Controlar progresso do upload
    // task.snapshotEvents.listen((StorageTaskEvent storageEvent) {
    //   if (storageEvent.type == StorageTaskEventType.progress) {
    //     setState(() {
    //       _subindoImagem = true;
    //     });
    //   } else if (storageEvent.type == StorageTaskEventType.success) {
    //     setState(() {
    //       _subindoImagem = false;
    //     });
    //   }
    // });

    //Recuperar url da imagem
    task.then((TaskSnapshot snapshot) {
      _recuperarUrlImagem(snapshot);
    });
  }

  Future _recuperarUrlImagem(TaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();
    _atualizarUrlImagemFirestore(url);

    setState(() {
      _urlImagemRecuperada = url;
    });
  }

  _atualizarNomeFirestore() {
    String nome = _controllerNome.text;
    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> dadosAtualizar = {"nome": nome};

    db.collection("users").doc(_idUsuarioLogado).update(dadosAtualizar);
  }

  _atualizarUrlImagemFirestore(String url) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> dadosAtualizar = {"urlImagem": url};

    db.collection("users").doc(_idUsuarioLogado).update(dadosAtualizar);
  }

  _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = auth.currentUser!;
    _idUsuarioLogado = usuarioLogado.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot =
        await db.collection("users").doc(_idUsuarioLogado).get();

    Map<String, dynamic> dados = snapshot.data as Map<String, dynamic>;
    _controllerNome.text = dados["nome"];

    if (dados["urlImagem"] != null) {
      _urlImagemRecuperada = dados["urlImagem"];
    }
  }

  @override
  void initState() {
    super.initState();
    _recuperarDadosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Perfil"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  child: _subindoImagem
                      ? const CircularProgressIndicator()
                      : Container(),
                ),
                CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey,
                    backgroundImage: _urlImagemRecuperada != null
                        ? NetworkImage(_urlImagemRecuperada!)
                        : null),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: const Text("Câmera"),
                      onPressed: () {
                        _recuperarImagem("camera");
                      },
                    ),
                    TextButton(
                      child: const Text("Galeria"),
                      onPressed: () {
                        _recuperarImagem("galeria");
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
                  padding: const EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                    child: const Text(
                      "Salvar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      _atualizarNomeFirestore();
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
