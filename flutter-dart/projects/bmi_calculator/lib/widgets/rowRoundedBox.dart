import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/roundedBox.dart';
import 'package:flutter/material.dart';

class RowRoundedBox extends StatefulWidget {
  final List<Widget> children;

  RowRoundedBox({this.children});

  @override
  _RowRoundedBoxState createState() => _RowRoundedBoxState();
}

class _RowRoundedBoxState extends State<RowRoundedBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: RoundedBox(
            childUsed: widget.children[0],
            colorUsed: kOffColorBox,
          ),
        ),
        Expanded(
          child: RoundedBox(
            childUsed: widget.children[1],
            colorUsed: kOffColorBox,
          ),
        )
      ],
    );
  }
}
