import 'package:bmi_calculator/functionality.dart';
import 'package:bmi_calculator/screens/ResultScreen.dart';
import 'package:bmi_calculator/widgets/bottomNavigationButton.dart';
import 'package:bmi_calculator/widgets/customAppBar.dart';
import 'package:bmi_calculator/widgets/boxSelector.dart';
import 'package:bmi_calculator/widgets/customSlider.dart';
import 'package:bmi_calculator/widgets/iconWithText.dart';
import 'package:bmi_calculator/widgets/roundedBox.dart';
import 'package:bmi_calculator/widgets/rowRoundedBox.dart';
import 'package:bmi_calculator/widgets/textWithLabel.dart';
import 'package:bmi_calculator/widgets/valueWithButtons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 60;
  int age = 32;
  int height = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: BoxSelector(
              children: [
                IconWithText(icon: FontAwesomeIcons.mars, text: "MALE"),
                IconWithText(icon: FontAwesomeIcons.venus, text: "FEMALE"),
              ],
            ),
          ),
          Expanded(
            child: RoundedBox(
              colorUsed: kOffColorBox,
              childUsed: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: kBody),
                  TextWithLabel(
                    value: height,
                    units: "cm",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomSlider(
                    value: height.toDouble(),
                    onChanged: (double newVal) {
                      setState(
                        () {
                          height = newVal.toInt();
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: RowRoundedBox(
              children: [
                ValueWithButtons(
                  measure: "WEIGHT",
                  value: weight,
                  units: "kg",
                  add: () {
                    setState(() {
                      weight++;
                    });
                  },
                  subtract: () {
                    setState(() {
                      weight--;
                    });
                  },
                ),
                ValueWithButtons(
                  measure: "AGE",
                  value: age,
                  units: "kg",
                  add: () {
                    setState(() {
                      age++;
                    });
                  },
                  subtract: () {
                    setState(() {
                      age--;
                    });
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BottomNavigationButton(
            text: "CALCULATE",
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    calculateBMI: CalculateBMI(
                      weight: weight,
                      height: height,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
