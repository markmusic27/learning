import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftButtonNumber = 1;
  int rightButtonNumber = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Dicee",
          ),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        var rng = Random();
                        leftButtonNumber = 1 + rng.nextInt(6 - 1);
                        rightButtonNumber = 1 + rng.nextInt(6 - 1);
                      });
                    },
                    child: Image.asset("images/dice$leftButtonNumber.png"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        var rng = Random();
                        rightButtonNumber = 1 + rng.nextInt(6 - 1);
                        leftButtonNumber = 1 + rng.nextInt(6 - 1);
                      });
                    },
                    child: Image.asset("images/dice$rightButtonNumber.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
