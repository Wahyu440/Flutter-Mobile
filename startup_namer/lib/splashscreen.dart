import 'package:flutter/material.dart';
import 'package:startup_namer/pertemuan9.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key, required this.title});

  final String title;

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  startSplashscreen() async {
    var duration = new Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Pertemuan9(title: "Coba Splashscreen"))
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Image.asset(
          "images/logoipsum.png",
          width: 100.0,
          height: 100.0,
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    startSplashscreen();
  }
}