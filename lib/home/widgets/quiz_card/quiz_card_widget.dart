import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/question_mode.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final int questionsAnswered;
  final List<QuestionModel> questions;

  const QuizCardWidget(
      {Key? key,
      required this.title,
      required this.image,
      required this.questionsAnswered,
      required this.questions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return ChallengePage(
            title: this.title,
            questions: this.questions,
          );
        }),
      ),
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
          Text(this.title, style: AppTextStyles.heading15),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text("$questionsAnswered de ${this.questions.length}",
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
