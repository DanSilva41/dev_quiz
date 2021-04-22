import 'dart:convert';

class AnswerModel {
  final String title;
  final bool right;

  AnswerModel({required this.title, required this.right});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'right': right,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      title: map['title'],
      right: map['right'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));
}
