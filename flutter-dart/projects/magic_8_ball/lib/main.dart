import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: MainPage(),
      ),
    );

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ask Me Anything"),
        backgroundColor: Color(0xff0A2463),
      ),
      body: GestureDetector(
        onTap: () {
          print("I got clicked");
          setState(() {
            ballNumber = Random().nextInt(5) + 1;
          });
        },
        child: Center(
          child: Image.asset("images/ball$ballNumber.png"),
        ),
      ),
    );
  }
}
