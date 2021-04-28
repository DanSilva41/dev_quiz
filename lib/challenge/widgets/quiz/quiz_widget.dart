import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_mode.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({Key? key, required this.question, required this.onChange})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexQuestionSelected = -1;

  AnswerModel answer(int index) => this.widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          Expanded(
              child: ListView(children: [
            for (var i = 0; i < this.widget.question.answers.length; i++)
              AnswerWidget(
                  answer: answer(i),
                  selected: this.indexQuestionSelected == i,
                  disabled: this.indexQuestionSelected != -1,
                  onTap: () {
                    indexQuestionSelected = i;
                    setState(() {});
                    Future.delayed(Duration(seconds: 1))
                        .then((value) => this.widget.onChange());
                  })
          ]))
        ],
      ),
    );
  }
}
