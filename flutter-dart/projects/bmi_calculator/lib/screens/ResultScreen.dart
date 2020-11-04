import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/functionality.dart';
import 'package:bmi_calculator/widgets/CustomAppBar.dart';
import 'package:bmi_calculator/widgets/bottomNavigationButton.dart';
import 'package:bmi_calculator/widgets/reviewText.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({this.calculateBMI});
  final CalculateBMI calculateBMI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Your Result",
                style: kTextBold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff1D1E33),
              ),
              margin: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calculateBMI.findReview(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    calculateBMI.findBMI().toString(),
                    style: kBiggerNumericBold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    calculateBMI.findInterpretation(),
                    style: kBody2,
                  )
                ],
              ),
            ),
          ),
          BottomNavigationButton(
            text: "RE-CALCULATE",
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
