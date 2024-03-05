import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleWiget extends StatelessWidget {
  const TitleWiget(
      {super.key, this.color, required this.svg, required this.text});
  final Color? color;
  final String svg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: screenWidth(2.9),
      child: Stack(
        children: [
          Transform.scale(
            scale: 1.55,
            child: SvgPicture.asset(
              color: color,
              "assets/images/svgs/status_bar_vector.svg",
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(20), start: screenWidth(19.2)),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: screenWidth(38.4)),
                  child: SvgPicture.asset(
                    'assets/images/svgs/$svg.svg',
                    color: AppColors.whiteColor,
                    width: screenWidth(19.2),
                    height: screenWidth(19.2),
                  ),
                ),
                CustomText(
                  text: text,
                  styleType: TextStyleType.BODY,
                  textColor: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
