// ignore_for_file: unused_field, unnecessary_null_comparison, unused_element

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

  File? _imagem;
  late String _idLogged;
  late bool _statusUpload = false;
  late String urlRec;

  Future _recuperarImagem(origemImagem) async {
    late File imagemSelec;

    final ImagePicker _picker = ImagePicker();
    switch (origemImagem) {
      case "camera":
        imagemSelec =
            (await _picker.pickImage(source: ImageSource.camera)) as File;
        break;
      case "galeria":
        imagemSelec =
            (await _picker.pickImage(source: ImageSource.gallery)) as File;
        break;
    }
    setState(() {
      _imagem = imagemSelec;
      _uploadImage();
    });
  }

  _uploadImage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz.child("perfil").child(_idLogged + "jpg");
    //upload image
    UploadTask task = arquivo.putFile(_imagem!);

    //controlar prog
    task.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      if (taskSnapshot.state == TaskState.running) {
        setState(() {
          _statusUpload = true;
        });
      } else if (taskSnapshot.state == TaskState.success) {
        _recuperarImagem(taskSnapshot);
        setState(() {
          _statusUpload = false;
        });
      }
    });
  }

  _recuperarURL(TaskSnapshot taskSnapshot) async {
    String url = await taskSnapshot.ref.getDownloadURL();
    _atualizarUrlImg(url);
    setState(() {
      urlRec = url;
    });
  }

  _recuperarDados() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User logged = (auth.currentUser) as User;
    _idLogged = logged.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot =
        await db.collection("users").doc(_idLogged).get();

    Map<String, dynamic> dados = snapshot.data as Map<String, dynamic>;
    _controllerNome.text = dados["nome"];
    if (dados["urlImg"] != null) {
      urlRec = dados["urlImg"];
    }
  }

  _atualizarUrlImg(String url) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> dadosAtt = {"urlImg": url};

    db.collection("users").doc(_idLogged).update(dadosAtt);
  }

  _atualizarNome() {
    String name = _controllerNome.text;
    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> dadosAtualizar = {"name": name};

    db.collection("users").doc(_idLogged).update(dadosAtualizar);
  }

  _atualizarNomeFirestore() {
    String name = _controllerNome.text;
    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> dadosAtualizar = {"name": name};

    db.collection("users").doc(_idLogged).update(dadosAtualizar);
  }

  @override
  void initState() {
    super.initState();

    _recuperarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 101, 187, 0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 101, 187, 0),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: const <Widget>[
                          Text(
                            'Familiar',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '12',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(urlRec)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            children: const <Widget>[
                              Text(
                                'Following',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '18',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "ID: 14552566",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 32),
                  child: Text(
                    'Herman Jimenez',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: const <Widget>[
                          Icon(
                            Icons.group_add,
                            color: Colors.white,
                          ),
                          Text(
                            'Friends',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: const <Widget>[
                          Icon(
                            Icons.group,
                            color: Colors.white,
                          ),
                          Text(
                            'Groups',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: const <Widget>[
                          Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                          Text(
                            'Videos',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: const <Widget>[
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          Text(
                            'Likes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            padding: const EdgeInsets.all(42),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        Icon(
                          Icons.table_chart,
                          color: Colors.grey,
                        ),
                        Text(
                          'Leaders',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(
                          Icons.show_chart,
                          color: Colors.grey,
                        ),
                        Text(
                          'Level up',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(
                          Icons.card_giftcard,
                          color: Colors.grey,
                        ),
                        Text(
                          'Leaders',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        Icon(
                          Icons.code,
                          color: Colors.grey,
                        ),
                        Text('QR code')
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(
                          Icons.blur_circular,
                          color: Colors.grey,
                        ),
                        Text('Daily bonus')
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                        Text('Visitors')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
