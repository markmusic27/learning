import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffD0E1F1),
        appBar: AppBar(
          backgroundColor: Color(0xff16233B),
          title: Text(
            "I Am Poor",
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/2/20/Coal_bituminous.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
