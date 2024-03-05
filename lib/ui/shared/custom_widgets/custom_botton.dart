import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton(
      {super.key,
      required this.text,
      this.color = AppColors.mainColor,
      this.width});
  final String text;
  final double? width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? screenWidth(1.5),
      height: screenWidth(8.3),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      child: Center(
        child: CustomText(
            text: text,
            textColor: AppColors.whiteColor,
            styleType: TextStyleType.BODY),
      ),
    );
  }
}
