import 'package:dev_quiz/challenge/challenge_controller.dart';
import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;
  ChallengePage({Key? key, required this.quiz}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengeControler = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    this.challengeControler.currentQuestionNotifier.addListener(() {
      setState(() {});
    });
    this.pageController.addListener(() {
      this.challengeControler.currentQuestion =
          this.pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: SafeArea(
            top: true,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                  tooltip: 'Voltar',
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.maybePop(context)),
              ValueListenableBuilder<int>(
                  valueListenable:
                      this.challengeControler.currentQuestionNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                        currentQuestion: value,
                        totalQuestions: widget.quiz.questions.length,
                      ))
            ])),
      ),
      body: PageView(
        controller: this.pageController,
        children: this
            .widget
            .quiz
            .questions
            .map((e) => QuizWidget(question: e, onChange: this.nextPage))
            .toList(),
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
              valueListenable: this.challengeControler.currentQuestionNotifier,
              builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (value < this.widget.quiz.questions.length)
                        Expanded(
                            child: NextButtonWidget.white(
                                label: 'Pular', onTap: this.nextPage)),
                      if (value == this.widget.quiz.questions.length)
                        SizedBox(width: 7),
                      if (value == this.widget.quiz.questions.length)
                        Expanded(
                            child: NextButtonWidget.green(
                                label: 'Finalizar',
                                onTap: () => Navigator.maybePop(context))),
                    ],
                  )),
        ),
      ),
    );
  }

  void nextPage() {
    if (this.challengeControler.currentQuestion <
        this.widget.quiz.questions.length)
      this
          .pageController
          .nextPage(duration: Duration(milliseconds: 10), curve: Curves.linear);
    else
      Navigator.maybePop(context);
  }
}
