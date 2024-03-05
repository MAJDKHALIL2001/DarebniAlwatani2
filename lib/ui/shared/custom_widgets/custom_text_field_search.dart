import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomSearch({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: screenWidth(18),
      ),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: screenWidth(30)),
          fillColor: AppColors.blackColorLowOpD2,
          filled: true,
          hintText: "بحث",
          hintStyle: TextStyle(
            color: AppColors.blackColorLowOp,
            fontSize: screenWidth(21),
          ),
          errorStyle: TextStyle(
            color: AppColors.mainColor,
            fontSize: screenWidth(21),
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: screenWidth(21.3),
            color: AppColors.blackColorLowOp,
          )),
    );
  }
}
