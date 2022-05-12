// // ignore_for_file: unused_element

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   final TextEditingController _controllerName = TextEditingController();
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPass = TextEditingController();

//   _userRegister() {
//     // Recupera dados dos campos

//     String name = _controllerName.text;
//     String email = _controllerEmail.text;
//     String pass = _controllerPass.text;
//     String _messageError = "";

//     if (name.isNotEmpty) {
//       if (email.isNotEmpty && email.contains("@")) {
//         if (pass.isNotEmpty) {
//           setState(() {
//             _messageError = "";
//           });
//           _userRegister();
//         } else {
//           setState(() {
//             _messageError = "Preencha a senha!";
//           });
//         }
//       } else {
//         setState(() {
//           _messageError = "Preencha o e-mail utilizando o @";
//         });
//       }
//     } else {
//       setState(() {
//         _messageError = "Preencha o Nome";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// _userRegister(String email, String pass) {
//   FirebaseAuth auth = FirebaseAuth.instance;

//   auth.createUserWithEmailAndPassword(
//     email: email,
//     password: pass,
//   );
// }

// // @override
// // Widget build(BuildContext context) {
// //   return Scaffold(
// //     appBar: AppBar(
// //       title: const Text("Cadastro"),
// //     ),
// //     body: Container(
// //       decoration: const BoxDecoration(
// //         color: Color.fromARGB(255, 239, 121, 91),
// //       ),
// //       padding: const EdgeInsets.all(16),
// //       child: Center(
// //           child: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: <Widget>[
// //             Padding(
// //               padding: const EdgeInsets.only(bottom: 32),
// //               child: Image.asset(
// //                 "images/logo/LogoPrinc.png",
// //                 width: 200,
// //                 height: 150,
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(bottom: 8),
// //               child: TextField(
// //                 controller: TextEditingController(),
// //                 autofocus: true,
// //                 keyboardType: TextInputType.text,
// //                 style: const TextStyle(fontSize: 20),
// //                 decoration: InputDecoration(
// //                     contentPadding: const EdgeInsets.fromLTRB(32, 16, 42, 16),
// //                     hintText: "Nome",
// //                     filled: true,
// //                     fillColor: Colors.white,
// //                     border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(22))),
// //               ),
// //             )
// //           ],
// //         ),
// //       )),
// //     ),
// //  );

