import 'package:dev_quiz/shared/enums/level_enum.dart';
import 'package:dev_quiz/shared/models/question_mode.dart';

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel(
      {required this.title,
      required this.questions,
      this.questionAnswered = 0,
      required this.image,
      required this.level})
      : assert(questions.length == 4);
}
