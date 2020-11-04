import 'package:bmi_calculator/widgets/reviewText.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculateBMI {
  CalculateBMI({@required this.height, @required this.weight});
  final int height;
  final int weight;

  List<ReviewText> review = [
    ReviewText(
      text: "UNDERWEIGHT",
      color: Color(0xffFF6700),
    ),
    ReviewText(
      text: "NORMAL",
      color: Color(0xff39FF14),
    ),
    ReviewText(
      text: "OVERWEIGHT",
      color: Color(0xffFF6700),
    ),
    ReviewText(
      text: "OBESE",
      color: Color(0xffff073a),
    )
  ];

  double findBMI() {
    double bmi = weight.toDouble();
    double heightSRD = pow(height / 100, 2);
    bmi = bmi / heightSRD;
    return double.parse(bmi.round().toString() + ".${bmi.toString()[3]}");
  }

  ReviewText findReview() {
    return review[findBMI() < 18.5
        ? 0
        : findBMI() >= 18.5 && findBMI() <= 24.9
            ? 1
            : findBMI() >= 25 && findBMI() <= 29.9
                ? 2
                : 3];
  }

  String findInterpretation() {
    return findBMI() < 18.5
        ? "Your BMI is quite low! Try eating more."
        : findBMI() >= 18.5 && findBMI() <= 24.9
            ? "You are a ok. Great Job!"
            : findBMI() >= 25 && findBMI() <= 29.9
                ? "You BMI is high! Eat less cookies."
                : "Your BMI is very high! Consult a doctor.";
  }
}
