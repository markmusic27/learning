import 'package:flutter/material.dart';

class ReviewText extends StatelessWidget {
  ReviewText({this.text, this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        color: color,
        fontSize: 20,
      ),
    );
  }
}
