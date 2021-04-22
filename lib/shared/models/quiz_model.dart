import 'dart:convert';

import 'package:dev_quiz/shared/enums/level_enum.dart';
import 'package:dev_quiz/shared/models/question_mode.dart';

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel(
      {required this.title,
      required this.questions,
      this.questionsAnswered = 0,
      required this.image,
      required this.level})
      : assert(questions.length > 0);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
        title: map['title'],
        questions: List<QuestionModel>.from(
            map['questions']?.map((x) => QuestionModel.fromMap(x))),
        questionsAnswered: map['questionsAnswered'],
        image: map['image'],
        level: map['level'].toString().parse);
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
