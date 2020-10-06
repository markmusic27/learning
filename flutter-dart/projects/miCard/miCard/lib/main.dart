import 'package:flutter/material.dart';
import "RoundedImage.dart";

void main() {
  runApp(MiCard());
}

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xffDCF4F9),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundedImage(),
                SizedBox(height: 10),
                Text(
                  "Mark Musis",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: "Product",
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "ENTREPRENEUR",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Product",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  color: Colors.black,
                  height: 1,
                  width: 120,
                )
              ],
            ),
          )),
    );
  }
}
