import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/login_view/login_view.dart';
import 'package:darrebni_exam/ui/views/sinup_view/sinup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SinupView extends StatefulWidget {
  SinupView({super.key});

  @override
  State<SinupView> createState() => _SinupViewState();
}

class _SinupViewState extends State<SinupView> {
  final SinupController controller = Get.put(SinupController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
      key: controller.formKey,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              top: screenWidth(19.2),
              start: screenWidth(30),
              end: screenWidth(30)),
          child: RefreshIndicator(
            onRefresh: () async {
              controller.onInit();
            },
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text: " أنشاء حساب",
                    styleType: TextStyleType.SUBTITLE,
                    textColor: AppColors.blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(7)),
                  child: Container(
                    width: screenWidth(2.1),
                    height: screenWidth(2.8),
                    child: SvgPicture.asset("assets/images/svgs/signup.svg"),
                  ),
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
                  prfixPhoto: "ic_phone",
                  controller: controller.usernameController,
                  validator: (value) {
                    if (value!.isEmpty)
                      return "ادخل اسم المستخدم";
                    else if (!isUsernameValid(value))
                      return "صيغة خاطئة";
                    else
                      return null;
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(20), bottom: screenWidth(30)),
                  child: CustomText(
                    text: 'رقم موبايل ',
                    styleType: TextStyleType.BODY,
                    textColor: AppColors.mainColor,
                  ),
                ),
                CustomTextFeild(
                  hintText: "رقم الموبايل ",
                  controller: controller.phoneNumberController,
                  prfixPhoto: "ic_profile",
                  validator: (value) {
                    if (value!.isEmpty)
                      return "ادخل رقم الهاتف";
                    else if (!isTenDigits(value))
                      return "09########الرقم من الشكل";
                    else
                      return null;
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(20)),
                  child: CustomText(
                    text: 'اختر الاختصاص',
                    styleType: TextStyleType.BODY,
                    textColor: AppColors.mainColor,
                  ),
                ),
                Obx(() => controller.listCollege.length == 0
                    ? SpinKitCircle(
                        color: AppColors.mainColor,
                      )
                    : Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        children: List<Widget>.generate(
                          controller.listCollege.length,
                          (index) => InkWell(
                            onTap: () {
                              controller.selectedCategoryIndex.value = index;
                            },
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  width: screenWidth(20),
                                  height: screenWidth(20),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: controller.selectedCategoryIndex
                                                  .value ==
                                              index
                                          ? AppColors.mainColor
                                          : AppColors.whiteColor,
                                      border: Border.all(
                                          color: AppColors.blackColor,
                                          width: 1)),
                                ),
                                SizedBox(width: screenWidth(38.4)),
                                Text('${controller.listCollege[index].name}'),
                              ],
                            ),
                          ),
                        ),
                      )),
                Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: screenWidth(10), bottom: screenWidth(40)),
                    child: InkWell(
                        onTap: () {
                          if (isOnline) {
                            if (controller.formKey.currentState!.validate()) {
                              controller.isLoading.value = true;

                              controller.sinUp(
                                  name: controller.usernameController.text,
                                  phoneNumber:
                                      controller.phoneNumberController.text,
                                  uuid: controller
                                      .listCollege[controller
                                          .selectedCategoryIndex.value]
                                      .collegeUuid
                                      .toString());
                            }
                          } else {
                            BotToast.showText(text: 'انت غير متصل');
                          }
                        },
                        child: Obx(() => controller.listCollege.length == 0
                            ? SizedBox()
                            : controller.isLoading.value
                                ? SpinKitCircle(color: AppColors.mainColor)
                                : CustomBotton(
                                    text: " إنشاء حساب",
                                  )))),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: screenWidth(30),
                    end: screenWidth(4.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: " لديك حساب؟",
                        textColor: AppColors.blackColor,
                      ),
                      InkWell(
                        onTap: () {
                          Get.off(LoginView());
                        },
                        child: CustomText(
                          text: "  تسجيل الدخول",
                          textColor: AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
