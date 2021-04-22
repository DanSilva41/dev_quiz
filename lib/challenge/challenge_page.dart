import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/shared/models/question_mode.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final String title;
  final List<QuestionModel> questions;
  ChallengePage({Key? key, required this.title, required this.questions})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(top: true, child: QuestionIndicatorWidget()),
      ),
      body: QuizWidget(
        title: widget.title,
        answers: widget.questions[0].answers,
      ),
    );
  }
}
