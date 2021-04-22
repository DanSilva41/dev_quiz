import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatefulWidget {
  final String text;
  final bool right;

  AnswerWidget({Key? key, required this.text, this.right = false})
      : super(key: key);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  late bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: () => {this.selected = !this.selected, setState(() {})},
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
                  this.widget.text,
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
    );
  }

  Color get _selectedColorRight =>
      widget.right ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      widget.right ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      widget.right ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      widget.right ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      widget.right ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => widget.right ? Icons.check : Icons.close;
}
