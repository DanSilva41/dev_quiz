import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          AnswerWidget(
              text: 'Kit de desenvolvimento de interface de usuário',
              right: false,
              selected: false),
          AnswerWidget(
              text:
                  'Possibilita a criação de aplicativos compilados nativamente',
              right: true,
              selected: true),
          AnswerWidget(
              text: 'É uma marca de café no Himalaia',
              right: false,
              selected: false),
          AnswerWidget(
              text: 'Possibilita a criação de desktops que são muito incríves',
              right: false,
              selected: false),
        ],
      ),
    );
  }
}
