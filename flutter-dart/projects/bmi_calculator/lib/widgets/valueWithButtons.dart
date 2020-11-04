import 'package:bmi_calculator/widgets/textWithLabel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'customRoundButton.dart';

class ValueWithButtons extends StatelessWidget {
  ValueWithButtons(
      {this.measure, this.value, this.units, this.add, this.subtract});
  final String measure;
  final String units;
  final int value;
  final Function add;
  final Function subtract;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          measure,
          style: kBody,
        ),
        TextWithLabel(value: value, units: units),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRoundButton(onTap: add, icon: FontAwesomeIcons.plus),
            SizedBox(
              width: 10,
            ),
            CustomRoundButton(onTap: subtract, icon: FontAwesomeIcons.minus)
          ],
        )
      ],
    );
  }
}
