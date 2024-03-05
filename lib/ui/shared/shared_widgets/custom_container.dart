import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.text,
      this.svg,
      this.color = AppColors.blackColor});
  final String text;
  final String? svg;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1.17),
      height: screenWidth(8.9),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: color ?? AppColors.blackColor,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: screenWidth(20), top: screenWidth(70)),
        child: Row(
          children: [
            CustomText(
                text: text, textColor: color, styleType: TextStyleType.BODY),
            Spacer(),
            svg != null
                ? SvgPicture.asset(
                    "assets/images/svgs/$svg.svg",
                    color: color,
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
