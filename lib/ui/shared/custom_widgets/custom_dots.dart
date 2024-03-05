import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomDots extends StatelessWidget {
  final dotsCount;
  final position;
  const CustomDots({super.key, this.dotsCount, this.position});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
        activeColor: AppColors.mainColor,
        activeShape: RoundedRectangleBorder(),
        shape: RoundedRectangleBorder(),
      ),
      dotsCount: dotsCount,
      position: position,
    );
  }
}
