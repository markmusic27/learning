import "dart:math";
import 'package:flutter/material.dart';

int leftButtonNumber = 1;
int rightButtonNumber = 1;
Color colorUsed = Color(0xff61C9A8);

List<Color> possibleColors = [
  Color(0xff6F2DBD),
  Color(0xffB9FAF8),
  Color(0xffFFCF00),
  Color(0xffFA003F),
  Color(0xff35FF69),
  Color(0xff3F84E5),
  Color(0xffBEFFC7),
  Color(0xff41EAD4),
  Color(0xff1C6E8C),
  Color(0xffFF9F1C),
  Color(0xff5F4BB6),
  Color(0xff26F0F1),
  Color(0xffFE5D26),
  Color(0xff662E9B),
  Color(0xffCCB0E8),
  Color(0xffFDD6C4),
  Color(0xffFCE388),
  Color(0xffAEE3EA),
  Color(0xffFF3CC7),
  Color(0xffF0F600),
  Color(0xff00E5E8),
  Color(0xffBC2C1A),
  Color(0xff7FB7BE),
  Color(0xffD999B9),
  Color(0xff8BE8CB),
  Color(0xffF0F66E),
  Color(0xffA53860)
];

void getColor() {
  var rng = Random();
  colorUsed = possibleColors[rng.nextInt(possibleColors.length - 1)];
}

void getImage() {
  var rng = Random();
  rightButtonNumber = 1 + rng.nextInt(6 - 1);
  leftButtonNumber = 1 + rng.nextInt(6 - 1);
}
