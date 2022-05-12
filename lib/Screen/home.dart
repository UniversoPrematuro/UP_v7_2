import 'package:flutter/material.dart';
import 'package:universoprem_v7_2/Screen/register.dart';
import 'package:universoprem_v7_2/Screen/login.dart';

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
      // appBar: AppBar(
      //   toolbarHeight: 14,
      //   backgroundColor: const Color.fromARGB(255, 255, 193, 143),
      //   elevation: 0,
      // ),
      body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
          child: Stack(children: <Widget>[
            Center(
              child: Image.asset(
                "images/logo/LogoMov.gif",
                width: 280,
              ),
            ),
            Padding(
              
              padding: const EdgeInsets.only(top: 650, left: 18),
              child: ElevatedButton(
                
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                }),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 255)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))),
                    minimumSize: MaterialStateProperty.all(const Size(75, 40)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 12.5, horizontal: 40.0))),
                child: GestureDetector(
                  
                  child: const Text(
                    "Primeira vez no Universo Prematuro?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 101, 187, 88),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 590, left: 45),
              child: ElevatedButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                }),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))),
                    minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 40.0))),
                child: const Text(
                  "Já tem uma conta? Entre!",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            )
          ])),
    );
  }
}
