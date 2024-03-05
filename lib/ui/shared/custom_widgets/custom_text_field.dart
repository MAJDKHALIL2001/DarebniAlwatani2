import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';

import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFeild extends StatelessWidget {
  final String? hintText;

  final String? prfixPhoto;
  final String? sufixPhoto;
  final Color? color;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextFeild({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.prfixPhoto,
    this.sufixPhoto,
    this.color = AppColors.mainColorLowOp,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: const Color.fromARGB(37, 81, 34, 85),
        fontSize: screenWidth(18),
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(color: AppColors.redColor),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(50)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: screenWidth(35)),
        fillColor: AppColors.blueColorLowOp,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: color,
          fontSize: screenWidth(18),
        ),
        prefixIcon: prfixPhoto != null
            ? Container(
                padding: EdgeInsets.all(screenWidth(40)),
                child: SvgPicture.asset(
                  "assets/images/svgs/$prfixPhoto.svg",
                  color: color,
                ),
              )
            : null,
        suffixIcon: sufixPhoto != null
            ? Container(
                padding: EdgeInsets.all(screenWidth(40)),
                child: SvgPicture.asset(
                  "assets/images/svgs/$sufixPhoto.svg",
                  color: color,
                ),
              )
            : null,
      ),
    );
  }
}
