import 'package:flutter/material.dart';
import 'dart:math';
import 'functionality.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorUsed,
        appBar: AppBar(
          backgroundColor: colorUsed,
          title: Text(
            "Dicee",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
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
                        getImage();
                        getColor();
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
                        getImage();
                        getColor();
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
