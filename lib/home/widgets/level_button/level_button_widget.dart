import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final Color color;
  final Color borderColor;
  final Color fontColor;

  LevelButtonWidget.facil()
      : this.label = "Fácil",
        this.color = AppColors.levelButtonFacil,
        this.fontColor = AppColors.levelButtonTextFacil,
        this.borderColor = AppColors.levelButtonBorderFacil;
  LevelButtonWidget.medio()
      : this.label = "Médio",
        this.color = AppColors.levelButtonMedio,
        this.fontColor = AppColors.levelButtonTextMedio,
        this.borderColor = AppColors.levelButtonBorderMedio;
  LevelButtonWidget.dificil()
      : this.label = "Difícil",
        this.color = AppColors.levelButtonDificil,
        this.fontColor = AppColors.levelButtonTextDificil,
        this.borderColor = AppColors.levelButtonBorderDificil;
  LevelButtonWidget.perito()
      : this.label = "Perito",
        this.color = AppColors.levelButtonPerito,
        this.fontColor = AppColors.levelButtonTextPerito,
        this.borderColor = AppColors.levelButtonBorderPerito;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.color,
        border: Border.fromBorderSide(BorderSide(color: this.borderColor)),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(this.label,
            style: GoogleFonts.notoSans(color: this.fontColor, fontSize: 13)),
      ),
    );
  }
}
