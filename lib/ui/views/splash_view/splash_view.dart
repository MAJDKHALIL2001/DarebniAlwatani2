import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/splash_view/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});
  final SplashController contoller = Get.put(SplashController());
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          child: Image.asset(
            'assets/images/pngs/mainbackground.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              top: screenWidth(1.5), start: screenWidth(3.9)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth(2.18),
                height: screenWidth(1.83),
                child: Image.asset(
                  'assets/images/pngs/logo.png',
                ),
              ),
              CustomText(
                text: "دربني للوطني",
                styleType: TextStyleType.TITLE,
                textColor: AppColors.logoColor,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenWidth(8)),
                child: Image.asset("assets/images/pngs/darrebni.png"),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
