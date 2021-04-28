import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/question_mode.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;

  const QuizCardWidget({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChallengePage(quiz: this.quiz))),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: 40, width: 40, child: Image.asset(AppImages.blocks)),
          SizedBox(height: 24),
          Text(this.quiz.title, style: AppTextStyles.heading15),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                      "${this.quiz.questionsAnswered} de ${this.quiz.questions.length}",
                      style: AppTextStyles.body11)),
              Expanded(
                flex: 2,
                child: ProgressIndicatorWidget(
                  value: .3,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
