import 'dart:async';

import 'package:flutter/material.dart';
import 'file:///D:/Magdalena%20Evelyn/CAMPUS%20PROJECT/kbti_ceritainaja/lib/chats/chatScreen.dart';
import 'package:kbti_ceritainaja/welcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  startSplashScreen() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_){
            return WelcomeScreen();
          })
      );
    });
  }

  double _height = 400;
  double _width = 400;

  @override
  void initState() {
    super.initState();
    var duration = const Duration(seconds: 2);
    Timer(duration, () {
      startSplashScreen();
      setState(() {
        if(_height != 600)
          _height = _height + 100;
        if(_width != 600)
          _width = _width + 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[200],
        body: Container(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.bounceOut,
                  width: _width,
                  height: _height,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: _width,
                    height: _height,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                ),
              ],
            )
        ),
      ),
    );
  }
}
