import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/login_view/login_view.dart';
import 'package:darrebni_exam/ui/views/main_view/main_view_wigdets/bottom_navigation_bar.dart';
import 'package:darrebni_exam/ui/views/sinup_view/sinup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  PageController pagercontroller = PageController();
  var selectedView = BottomNavigationEnum.HOME.obs;

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
  }

  // void toggleAllproduct() {
  //   selectedView.value = BottomNavigationEnum.PRODUCT;
  //   pagercontroller.jumpToPage(0);
  // }

  void togglemainTap(BottomNavigationEnum selecteEnum, int index) {
    storege.getFirstLunch()
        ? {
            Get.dialog(AlertDialog(
              content: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: screenWidth(2)),
                    child: TextButton(
                      child: Icon(
                        Icons.close,
                        color: AppColors.blackColor,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  SvgPicture.asset("assets/images/svgs/pop-up.svg"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenWidth(20)),
                    child: CustomText(
                      text: "يرجى الإشتراك لإتمام عملية التصفح",
                      textColor: AppColors.blackColor,
                      styleType: TextStyleType.BODY,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Get.off(LoginView());
                      },
                      child: CustomBotton(text: "تسجيل الدخول")),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: screenWidth(12), top: screenWidth(20)),
                    child: Row(
                      children: [
                        CustomText(
                          text: "ليس لديك حساب؟",
                          textColor: AppColors.blackColor,
                        ),
                        InkWell(
                          onTap: () {
                            Get.off(SinupView());
                          },
                          child: CustomText(
                            text: "أنشأ حسابك الان",
                            textColor: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ))
          }
        : {selectedView.value = selecteEnum, pagercontroller.jumpToPage(index)};
  }
}
