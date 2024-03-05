import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/custom_container.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/about_us/about_us_view.dart';
import 'package:darrebni_exam/ui/views/edit_person_view/edit_person_view.dart';
import 'package:darrebni_exam/ui/views/main_view/details_view/details_controller.dart';
import 'package:darrebni_exam/ui/views/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  DetailsView({super.key});
  final DetailsController controller = Get.put(DetailsController());
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: ListView(
        children: [
          Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: screenWidth(15)),
            child: Column(
              children: [
                TitleWiget(svg: "ic_profile", text: "الملف الشخصي"),
                Container(
                  height: screenWidth(3.84),
                  child: Image.asset(
                    "assets/images/pngs/user.png",
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(20), bottom: screenWidth(5)),
                  child: Center(
                    child: CustomText(
                      text: 'اسم المستخدم',
                      styleType: TextStyleType.BODY,
                      textColor: AppColors.blackColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => EditProfileView());
                  },
                  child: CustomContainer(
                    text: 'المعلومات الشخصية',
                    color: AppColors.mainColor,
                    svg: "ic_edit",
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: screenWidth(20)),
                  child: InkWell(
                    onTap: () {
                      Get.dialog(AlertDialog(
                        content: SingleChildScrollView(
                            child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: screenWidth(2)),
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
                            SvgPicture.asset(
                                "assets/images/svgs/send_feed_back.svg"),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  top: screenWidth(40),
                                  bottom: screenWidth(30)),
                              child: Container(
                                color: AppColors.grey,
                                child: TextFormField(
                                  controller: controller.suggestController,
                                  validator: (value) {
                                    if (value!.isEmpty)
                                      return "ادخل رقم الهاتف";
                                    else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "ارسل شكوى/اقتراح",
                                      contentPadding:
                                          EdgeInsetsDirectional.only(
                                              start: screenWidth(30),
                                              top: screenWidth(30),
                                              bottom: screenWidth(3))),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  if (controller.formKey.currentState
                                          ?.validate() ??
                                      false) {
                                    controller.addSuggest(
                                        text:
                                            controller.suggestController.text);
                                  }
                                },
                                child: CustomBotton(text: "ارسل"))
                          ],
                        )),
                      ));
                    },
                    child: CustomContainer(
                      text: 'ارسال شكاوي',
                      color: AppColors.blueColor,
                      svg: "ic_send",
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(AboutUsView());
                  },
                  child: CustomContainer(
                    text: 'عن التطبيق',
                    color: AppColors.blackColor,
                    svg: "ic_info",
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(5)),
                  child: InkWell(
                      child: InkWell(
                          onTap: () {
                            controller.Logout();
                          },
                          child: CustomBotton(text: 'تسجيل الخروج'))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
