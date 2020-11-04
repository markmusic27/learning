import 'package:flutter/material.dart';
import '../constants.dart';

class CustomRoundButton extends StatelessWidget {
  CustomRoundButton({@required this.onTap, @required this.icon});
  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      elevation: 6,
      fillColor: kOnColorBox,
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 50, minWidth: 50),
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
