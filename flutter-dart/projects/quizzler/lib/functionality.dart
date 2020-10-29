import 'package:flutter/material.dart';

import 'main.dart';

class QuestionBuilder {
  String question;
  bool answer;

  QuestionBuilder(this.question, this.answer);
}

List<QuestionBuilder> questionList = [
  QuestionBuilder("Trees absorb more C02 than humans.", true),
  QuestionBuilder("You can kill bacteria by freezing it.", false),
  QuestionBuilder("The current USA flag was made in 1960", false),
  QuestionBuilder("Goldfish only have a memory of three seconds", false),
  QuestionBuilder("The capital of Libya is Benghazi", false),
  QuestionBuilder(
      "Brazil is the only country in the Americas to have the official language of Portuguese",
      true),
  QuestionBuilder(
      "According to Scottish law, it is illegal to be drunk in charge of a cow",
      true),
  QuestionBuilder(
      "Charlie Chaplin came first in a Charlie Chaplin look-alike contest",
      false),
  QuestionBuilder("A metre is further than a yard", true),
  QuestionBuilder("Ben Nevis is the tallest mountain in the UK", true),
  QuestionBuilder("Napoleon was of below-average height", false),
  QuestionBuilder("The currency of France is the Franc", false),
  QuestionBuilder("The first tea bags were made of silk", true),
];

List<Widget> scoreKeeper = [
  SizedBox(
    height: 30,
  )
];
double scorePercentage = 0;

checkIfCorrect(bool buttonUsed) {
  if (buttonUsed == questionList[currentQuestion].answer) {
    print("correct");
    scorePercentage++;
    print(scorePercentage);
    scoreKeeper.add(
      Icon(
        Icons.done,
        color: Colors.green,
        size: 28,
      ),
    );
  } else {
    scoreKeeper.add(
      Icon(
        Icons.clear,
        color: Colors.red,
        size: 28,
      ),
    );
  }
}

checkIfDone() {
  if (currentQuestion == questionList.length - 1) {
    scorePercentage = (scorePercentage / questionList.length) * 100;
    massColor = Colors.white;
    colorTextDisplayed = Colors.black;
    textDisplayed =
        "Quiz has finished! You got ${scorePercentage.round()}% correct!";
    buttonTrueColor = Colors.white;
    buttonFalseColor = Colors.white;
  } else {
    textDisplayed =
        questionList[currentQuestion = currentQuestion + 1].question;
  }
}
