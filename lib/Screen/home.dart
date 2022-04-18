import 'package:flutter/material.dart';
import 'package:universoprem_v7_2/Screen/register.dart';

import 'login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 101, 188, 88),
        label: const Text(
          'Entrar',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        icon: const Icon(Icons.forward,
            color: Color.fromARGB(255, 255, 255, 255)),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Login()));
        },
      ),
      body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 15),
          child: Stack(
            children: <Widget>[
              Center(
                child: Image.asset("images/logo/LogoPrinc.png"),
                widthFactor: 250,
              ),
              GestureDetector(
                child: const Text(
                  "Primeiro cadastro",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                },
              )
            ],
          )),
    );
  }
}
