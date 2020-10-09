import 'package:flutter/material.dart';
import "RoundedImage.dart";

void main() {
  runApp(MiCard());
}

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xff99E1D9),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundedImage(),
                SizedBox(height: 10),
                SuTata(),
                SizedBox(height: 3),
                Text(
                  "ENTREPRENEUR",
                  style: TextStyle(
                    color: Color(0xff32292F),
                    fontSize: 20,
                    fontFamily: "Product",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  color: Color(0xff32292F),
                  height: 1,
                  width: 120,
                ),
                SizedBox(height: 15),
                PhoneBox(),
                SizedBox(height: 8),
                EmailBox()
              ],
            ),
          )),
    );
  }
}

class SuTata extends StatelessWidget {
  const SuTata({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Mark Music",
      style: TextStyle(
        color: Color(0xff32292F),
        fontSize: 30,
        fontFamily: "Product",
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class PhoneBox extends StatelessWidget {
  const PhoneBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff32292F),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 3,
            color: Color(0xff32292F),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Icon(
              Icons.phone,
              color: Color(0xff99E1D9),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "(+506) 7109-9519",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: "Product",
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmailBox extends StatelessWidget {
  const EmailBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff32292F),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 3,
            color: Color(0xff32292F),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Icon(
              Icons.mail,
              color: Color(0xff99E1D9),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "markmusic999@gmail.com",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: "Product",
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}
