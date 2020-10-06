import 'package:flutter/material.dart';
import 'constants.dart';

int message1 = 0;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xff),
          appBar: AppBar(
            title: Text(
              "Mark Music Lizano",
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
            backgroundColor: Color(0xffDCF763),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/tedx.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff000000).withOpacity(0.6),
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: Offset(2, 2)),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
