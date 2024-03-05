import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    this.isSelected = false,
    required this.ontap,
    required this.svgPath,
  });
  final String svgPath;
  final Function ontap;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: isSelected!
                    ? BorderSide(width: 3, color: AppColors.mainColor)
                    : BorderSide.none)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "$svgPath",
            width: screenWidth(10),
            height: screenWidth(14),
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}
