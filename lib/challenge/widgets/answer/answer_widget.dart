import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool selected;
  final bool disabled;
  final VoidCallback onTap;

  const AnswerWidget(
      {Key? key,
      required this.answer,
      required this.selected,
      this.disabled = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: this.disabled,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: selected ? _selectedColorCardRight : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: selected
                        ? _selectedBorderCardRight
                        : AppColors.border))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    this.answer.title,
                    style:
                        selected ? _selectedTextStyleRight : AppTextStyles.body,
                  ),
                ),
                Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        color: selected ? _selectedColorRight : AppColors.white,
                        borderRadius: BorderRadius.circular(500),
                        border: Border.fromBorderSide(BorderSide(
                            color: selected
                                ? _selectedBorderRight
                                : AppColors.border))),
                    child: selected
                        ? Icon(selected ? _selectedIconRight : Icons.check,
                            color: AppColors.white, size: 16)
                        : null)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color get _selectedColorRight =>
      this.answer.right ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      this.answer.right ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      this.answer.right ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      this.answer.right ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight => this.answer.right
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight =>
      this.answer.right ? Icons.check : Icons.close;
}
