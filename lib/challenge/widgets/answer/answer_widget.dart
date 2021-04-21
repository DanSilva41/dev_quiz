import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String text;
  final bool right;
  final bool selected;

  const AnswerWidget(
      {Key? key, required this.text, this.right = false, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: selected ? _selectedColorCardRight : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
                color:
                    selected ? _selectedBorderCardRight : AppColors.border))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                this.text,
                style: selected ? _selectedTextStyleRight : AppTextStyles.body,
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
                    ? Icon(Icons.check, color: AppColors.white, size: 16)
                    : null)
          ],
        ),
      ),
    );
  }

  Color get _selectedColorRight =>
      right ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      right ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      right ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight => right ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      right ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => right ? Icons.check : Icons.close;
}
