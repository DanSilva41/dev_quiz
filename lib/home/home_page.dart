import 'package:dev_quiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget.facil(),
                    LevelButtonWidget.medio(),
                    LevelButtonWidget.dificil(),
                    LevelButtonWidget.perito(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: [
                      QuizCardWidget(),
                      QuizCardWidget(),
                      QuizCardWidget(),
                      QuizCardWidget(),
                      QuizCardWidget(),
                      QuizCardWidget(),
                      QuizCardWidget(),
                    ],
                  ),
                )
              ],
            )));
  }
}
