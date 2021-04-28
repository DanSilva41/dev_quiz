import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percentValue;
  const ScoreCardWidget({Key? key, required this.percentValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: ChartWidget(
                    percentValue: this.percentValue,
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Vamos começar", style: AppTextStyles.heading),
                          Text(
                            "Complete os desafios e avançe em conhecimento",
                            style: AppTextStyles.body,
                          )
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
