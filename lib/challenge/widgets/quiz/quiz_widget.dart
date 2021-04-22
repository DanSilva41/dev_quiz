import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  final List<AnswerModel> answers;

  const QuizWidget({Key? key, required this.title, required this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          Expanded(
              child: ListView(
                  children: this
                      .answers
                      .map((a) => AnswerWidget(
                            text: a.title,
                            right: a.right,
                          ))
                      .toList())),
        ],
      ),
    );
  }
}
