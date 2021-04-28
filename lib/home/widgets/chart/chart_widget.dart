import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percentValue;
  const ChartWidget({Key? key, required this.percentValue}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    this._animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    this._animation = Tween<double>(begin: 0.0, end: widget.percentValue)
        .animate(this._animationController);
    this._animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: AnimatedBuilder(
          builder: (context, _) => Stack(
            children: [
              Center(
                  child: Container(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: this._animation.value,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  backgroundColor: AppColors.chartSecondary,
                ),
              )),
              Center(
                  child: Text(
                "${(this._animation.value * 100).toInt()}%",
                style: AppTextStyles.heading,
              ))
            ],
          ),
          animation: this._animation,
        ));
  }
}
