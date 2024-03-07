import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/login_view/login_controller.dart';
import 'package:darrebni_exam/ui/views/main_view/main_view.dart';
import 'package:darrebni_exam/ui/views/sinup_view/sinup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RefreshIndicator(
      onRefresh: () async {
        controller.onInit();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              top: screenWidth(19.2),
              start: screenWidth(19.2),
              end: screenWidth(19.2)),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Center(
                  child: CustomText(
                    text: "تسجيل الدخول",
                    styleType: TextStyleType.SUBTITLE,
                    textColor: AppColors.blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(7)),
                  child: Container(
                      width: screenWidth(2.1),
                      height: screenWidth(2.8),
                      child: SvgPicture.asset('assets/images/svgs/Login.svg')),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(20), bottom: screenWidth(30)),
                  child: CustomText(
                    text: 'اسم المستخدم',
                    styleType: TextStyleType.BODY,
                    textColor: AppColors.mainColor,
                  ),
                ),
                CustomTextFeild(
                  hintText: "اسم المستخدم",
                  prfixPhoto: "ic_profile",
                  controller: controller.usernameController,
                  validator: (value) {
                    if (value!.isEmpty)
                      return "ادخل اسم المستخدم";
                    else
                      return null;
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(20), bottom: screenWidth(30)),
                  child: CustomText(
                    text: 'رمز الدخول ',
                    styleType: TextStyleType.BODY,
                    textColor: AppColors.mainColor,
                  ),
                ),
                CustomTextFeild(
                  hintText: "رمز الدخول ",
                  controller: controller.codeController,
                  prfixPhoto: "ic_key",
                  validator: (value) {
                    if (value!.isEmpty)
                      return "ادخل الرمز ";
                    else if (!isValidEntryCode(value))
                      return "الرمز من 6 خانات";
                    else
                      return null;
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(10), bottom: screenWidth(40)),
                  child: InkWell(
                    onTap: () {
                      Get.off(SinupView());
                    },
                    child: InkWell(
                      onTap: () {
                        if (isOnline) {
                          if (controller.formKey.currentState!.validate()) {
                            controller.Login(
                                code: controller.codeController.text,
                                name: controller.usernameController.text);
                            controller.isLoading.value = true;
                          }
                        } else
                          BotToast.showText(text: 'انت غير متصل');
                      },
                      child: Obx(
                        () => controller.isLoading.value
                            ? SpinKitCircle(
                                color: AppColors.mainColor,
                              )
                            : CustomBotton(
                                text: "تسجيل الدخول",
                              ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: screenWidth(30),
                    end: screenWidth(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(12), start: screenWidth(2.5)),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => MainView());
                    },
                    child: CustomText(
                      text: "المتابعة كزائر",
                      textDecoration: TextDecoration.underline,
                      styleType: TextStyleType.SMALL,
                      textColor: AppColors.blackColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
