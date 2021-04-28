import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  const QuestionIndicatorWidget(
      {Key? key, required this.currentQuestion, required this.totalQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Questão ${this.currentQuestion}", style: AppTextStyles.body),
            Text("de ${this.totalQuestions}", style: AppTextStyles.body)
          ],
        ),
        SizedBox(height: 16),
        ProgressIndicatorWidget(
          value: this.currentQuestion / this.totalQuestions,
        )
      ]),
    );
  }
}
