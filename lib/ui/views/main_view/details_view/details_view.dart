import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/custom_container.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/about_us/about_us_view.dart';
import 'package:darrebni_exam/ui/views/edit_person_view/edit_person_view.dart';
import 'package:darrebni_exam/ui/views/main_view/details_view/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  DetailsView({super.key});
  final DetailsController controller = Get.put(DetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.onInit();
        },
        child: ListView(
          children: [
            Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: screenWidth(15)),
              child: Column(
                children: [
                  TitleWiget(svg: "ic_profile", text: "الملف الشخصي"),
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: screenWidth(4)),
                    child: Container(
                      height: screenWidth(3.84),
                      child: Image.asset(
                        "assets/images/pngs/user.png",
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      isOnline
                          ? Get.to(() => EditProfileView())
                          : BotToast.showText(text: 'انت غير متصل');
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                  child: Form(
                                key: controller.formKey,
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
                                          controller.isLoading.value = false;
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
                                          controller:
                                              controller.suggestController,
                                          validator: (value) {
                                            if (value!.isEmpty)
                                              return "الرجاء ادخال النص";
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
                                          if (isOnline) {
                                            if (controller.formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              controller.isLoading.value = true;
                                              controller.addSuggest(
                                                  text: controller
                                                      .suggestController.text);
                                            }
                                          } else {
                                            BotToast.showText(
                                                text: 'انت غير متصل');
                                          }
                                        },
                                        child: Obx(
                                          () => controller.isLoading.value
                                              ? SpinKitCircle(
                                                  color: AppColors.mainColor)
                                              : CustomBotton(text: "ارسل"),
                                        ))
                                  ],
                                ),
                              )),
                            );
                          },
                        );
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
                              isOnline
                                  ? {
                                      controller.Logout(),
                                      controller.isLoadingLogout.value = true
                                    }
                                  : BotToast.showText(text: 'انت غير متصل');
                            },
                            child: Obx(
                              () => controller.isLoadingLogout.value
                                  ? SpinKitCircle(
                                      color: AppColors.mainColor,
                                    )
                                  : Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          top: screenWidth(10)),
                                      child: CustomBotton(text: 'تسجيل الخروج'),
                                    ),
                            ))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
