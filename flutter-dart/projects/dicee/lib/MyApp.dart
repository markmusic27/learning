import 'package:flutter/material.dart';
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
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Image.asset("assets/images/rollifyblack.png"),
          ),
          title: Text(
            "rollify",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "Aero",
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
                    child:
                        Image.asset("assets/images/dice$leftButtonNumber.png"),
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
                    child:
                        Image.asset("assets/images/dice$rightButtonNumber.png"),
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
