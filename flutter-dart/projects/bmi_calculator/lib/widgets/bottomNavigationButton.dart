import 'package:flutter/material.dart';

import '../constants.dart';

class BottomNavigationButton extends StatelessWidget {
  BottomNavigationButton({@required this.text, @required this.onPress});

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 100,
        width: double.infinity,
        color: kAccentColor,
        child: SafeArea(
          child: Center(
            child: Text(
              text,
              style: kTextBold,
            ),
          ),
        ),
      ),
    );
  }
}
