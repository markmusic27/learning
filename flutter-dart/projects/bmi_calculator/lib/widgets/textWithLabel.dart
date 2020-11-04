import 'package:flutter/material.dart';

import '../constants.dart';

class TextWithLabel extends StatelessWidget {
  TextWithLabel({this.value, this.units});

  final int value;
  final String units;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(value.toString(), style: kNumericBold),
        Text(
          " $units",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
