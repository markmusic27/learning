import 'package:flutter/material.dart';
import '../constants.dart';

class CustomSlider extends StatelessWidget {
  CustomSlider({@required this.value, this.onChanged});
  final double value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          overlayColor: kAccentColor.withOpacity(0.16),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
          thumbColor: kAccentColor,
          activeTrackColor: Colors.white,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
          inactiveTrackColor: Colors.grey),
      child: Slider(
        value: value,
        min: 120,
        max: 220,
        onChanged: onChanged,
      ),
    );
  }
}
