import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String titleQuiz;
  final int correctQuestions, totalQuestions;

  const ResultPage(
      {Key? key,
      required this.titleQuiz,
      required this.correctQuestions,
      required this.totalQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [Image.asset(AppImages.trophy)],
          ),
          Column(
            children: [
              Text(
                'Parabéns!',
                style: AppTextStyles.heading40,
              ),
              SizedBox(
                height: 16,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: "Você concluiu", style: AppTextStyles.body),
                  TextSpan(text: "\n$titleQuiz", style: AppTextStyles.bodyBold),
                  TextSpan(
                      text:
                          "\ncom $correctQuestions de $totalQuestions acertos",
                      style: AppTextStyles.body),
                ]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 68),
                          child: NextButtonWidget.purple(
                              label: 'Compartilhar',
                              onTap: () {
                                Share.share(
                                    'Dev Quiz: $titleQuiz | Obtive ${(correctQuestions / totalQuestions) * 100}% de aproveitamento');
                              }))),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 68),
                          child: NextButtonWidget.white(
                              label: 'Voltar ao início',
                              onTap: () => Navigator.pop(context)))),
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
