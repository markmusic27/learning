import 'package:flutter/material.dart';

class ListBuilder {
  String question;
  bool answer;

  ListBuilder(this.question, this.answer);
}

List<ListBuilder> questionList = [
  ListBuilder(),
];
