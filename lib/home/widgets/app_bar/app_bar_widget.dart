import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/widgets.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                                text: "Danilo Silva",
                                style: AppTextStyles.titleBold)
                          ])),
                      Container(
                          width: 58,
                          height: 58,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppImages.profile,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(),
                )
              ]),
            ));
}
