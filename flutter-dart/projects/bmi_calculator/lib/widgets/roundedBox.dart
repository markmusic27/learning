import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundedBox extends StatefulWidget {
  RoundedBox({this.childUsed, this.gender, this.colorUsed, this.onTap});
  final Widget childUsed;
  final int gender;
  final Color colorUsed;
  final Function onTap;

  @override
  _RoundedBoxState createState() => _RoundedBoxState();
}

class _RoundedBoxState extends State<RoundedBox> {
  bool clickedActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        height: double.infinity,
        child: widget.childUsed,
        decoration: BoxDecoration(
          color: widget.colorUsed,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
