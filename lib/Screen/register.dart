// ignore_for_file: unused_element, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universoprem_v7_2/Classes/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:universoprem_v7_2/Screen/profile.dart';

import 'home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Controladores
  final TextEditingController _controllerNome =
      TextEditingController(text: "Gabriel");
  final TextEditingController _controllerEmail =
      TextEditingController(text: "gabrielnfa999@icloudcom");
  final TextEditingController _controllerSenha =
      TextEditingController(text: "1234567");
  String _errorMessage = "";

  _validarCampos() {
    //Recupera dados dos campos
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    Usuario usuario = Usuario();
    usuario.nome = nome;
    usuario.senha = senha;
    usuario.email = email;
    var errorMessage = _errorMessage;

    if (nome.isNotEmpty && nome.length >= 3) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty && senha.length >= 5) {
          setState(() {
            _errorMessage = "Usuário cadastrado com sucesso!";
          });
          _cadastrarUsuario(usuario);
        } else {
          setState(() {
            _errorMessage = "Preencha a senha! digite mais de 6 caracteres";
          });
        }
      } else {
        setState(() {
          _errorMessage = "Preencha o E-mail utilizando @";
        });
      }
    } else {
      setState(() {
        _errorMessage = "Preencha o Nome";
      });
    }
  }

  _cadastrarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      FirebaseFirestore db = FirebaseFirestore.instance;
      db.collection("users").doc(firebaseUser.user?.uid).set(usuario.toMap());

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    }).catchError((error) {
      if (kDebugMode) {
        print("erro app: " + error.toString());
      }
      setState(() {
        _errorMessage =
            "Erro ao cadastrar usuário, verifique os campos e tente novamente!";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        backgroundColor: const Color.fromARGB(255, 239, 121, 91),
        elevation: 0,
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 121, 91)),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "images/logo/logologin.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  //INPUT NOME
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerNome,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        )),
                  ),
                ),
                Padding(
                  //INPUT EMAIL
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        )),
                  ),
                ),
                TextField(
                  // INPUT SENHA
                  controller: _controllerSenha,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        _validarCampos();
                        if (_validarCampos() == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()));
                        }
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)),
                          backgroundColor:
                              const Color.fromARGB(255, 101, 187, 88)),
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
                Center(
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
