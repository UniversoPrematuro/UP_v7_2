import 'package:flutter/material.dart';
import 'package:universoprem_v7_2/Screen/profile.dart';
import 'package:universoprem_v7_2/Screen/register.dart';


import 'login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  // final _controller = VideoPlayerController.network(
  //       'images/logo/Logomov.mp3')
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {
          
  //       });
  //     });
  

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
                
                child: Image.asset("images/logo/LogoPrinc.png", width: 230,),
                widthFactor: 250,
                
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 620, right: 230),
                  child: Center(
                    child: GestureDetector(
                      child: const Text(
                        "Cadastre-se",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()));
                      },
                    ),
                  ),
                )
            ],
          )),
    );
  }
}
