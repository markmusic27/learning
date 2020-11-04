import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/InputPage.dart';
import 'package:bmi_calculator/screens/ResultScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff0A0D22),
        brightness: Brightness.dark,
        accentColor: Color(0xffEB1555),
        scaffoldBackgroundColor: kPrimaryColor,
        fontFamily: "Product Sans",
      ),
      home: InputPage(),
    );
  }
}
