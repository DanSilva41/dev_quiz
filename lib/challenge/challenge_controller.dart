import 'package:flutter/material.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier<int>(1);
  int get currentQuestion => this.currentQuestionNotifier.value;
  set currentQuestion(int value) => currentQuestionNotifier.value = value;

  int quantityCorrectQuestions = 0;
}
