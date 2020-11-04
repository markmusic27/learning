import 'package:bmi_calculator/widgets/roundedBox.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

enum Gender {
  female,
  male,
}

class BoxSelector extends StatefulWidget {
  final List<Widget> children;

  BoxSelector({this.children});

  @override
  _BoxSelectorState createState() => _BoxSelectorState();
}

class _BoxSelectorState extends State<BoxSelector> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RoundedBox(
            onTap: () {
              setState(() {
                selectedGender = Gender.male;
              });
            },
            childUsed: widget.children[0],
            colorUsed:
                selectedGender == Gender.male ? kOnColorBox : kOffColorBox,
          ),
        ),
        Expanded(
          child: RoundedBox(
            onTap: () {
              setState(() {
                selectedGender = Gender.female;
              });
            },
            childUsed: widget.children[1],
            colorUsed:
                selectedGender == Gender.female ? kOnColorBox : kOffColorBox,
          ),
        )
      ],
    );
  }
}
