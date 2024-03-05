import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_carouse.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_dots.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text_field_search.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/custom_container.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/collage_view/collage_view.dart';
import 'package:darrebni_exam/ui/views/login_view/login_view.dart';
import 'package:darrebni_exam/ui/views/main_view/home_view/home_controller.dart';
import 'package:darrebni_exam/ui/views/sinup_view/sinup_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeContorller controller = Get.put(HomeContorller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Obx(
        () => ListView(children: [
          TitleWiget(
            svg: "ic_home",
            text: 'الرئيسية',
            color: AppColors.mainColor,
          ),
          Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
            child: Column(
              children: [
                CustomSearch(),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(20), bottom: screenWidth(30)),
                  child: CustomCarous(
                    images: controller.listImageCarous,
                    width: screenWidth(2.5),
                    height: screenWidth(4),
                    onPageChanged: (index, reason) {
                      controller.updateCurrentIndex(index);
                    },
                  ),
                ),
                CustomDots(
                  dotsCount: controller.listImageCarous.length,
                  position: controller.currentIndex.value,
                ),
                Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: screenWidth(20), bottom: screenWidth(20)),
                    child: CustomContainer(
                      text: "التصنيفات",
                    )),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.addedTypes.map((category) {
                      return Padding(
                        padding: EdgeInsets.all(screenWidth(30)),
                        child: InkWell(
                          onTap: () {
                            controller.selectedCategory.value = category;
                            controller.filterColleges();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: category ==
                                        controller.selectedCategory.value
                                    ? AppColors.mainColor
                                    : AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: AppColors.mainColor)),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth(30)),
                              child: CustomText(
                                text: category,
                                textColor: category ==
                                        controller.selectedCategory.value
                                    ? AppColors.whiteColor
                                    : AppColors.mainColor,
                                styleType: TextStyleType.BODY,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                controller.listCollege.isEmpty
                    ? SpinKitCircle(
                        color: AppColors.blackColor,
                      )
                    : GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: screenWidth(38.4),
                          crossAxisSpacing: 2,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: controller.filteredColleges.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              controller.filteredColleges[index].collegeUuid !=
                                      storege.getCollegeUuid()
                                  ? Get.dialog(AlertDialog(
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
                                              "assets/images/svgs/pop-up.svg"),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: screenWidth(20)),
                                            child: CustomText(
                                              text:
                                                  "يرجى الإشتراك لإتمام عملية التصفح",
                                              textColor: AppColors.blackColor,
                                              styleType: TextStyleType.BODY,
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Get.to(LoginView());
                                              },
                                              child: CustomBotton(
                                                  text: "تسجيل الدخول")),
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: screenWidth(12),
                                                top: screenWidth(20)),
                                            child: Row(
                                              children: [
                                                CustomText(
                                                  text: "ليس لديك حساب؟",
                                                  textColor:
                                                      AppColors.blackColor,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.off(SinupView());
                                                  },
                                                  child: CustomText(
                                                    text: "أنشأ حسابك الان",
                                                    textColor:
                                                        AppColors.mainColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                    ))
                                  : Get.dialog(AlertDialog(
                                      content: SingleChildScrollView(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text:
                                                  "الرجاء تحديد الاختصاص ونوع الفحص",
                                              textColor: AppColors.blackColor,
                                              styleType:
                                                  TextStyleType.SUBTITLE),
                                          CustomText(
                                            text: "الاختصاص",
                                            textColor: AppColors.blackColor,
                                          ),
                                          Obx(
                                            () => SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: controller
                                                    .listSpecialities
                                                    .map((category) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .selectedSpecialities
                                                            .value = category.name!;
                                                        controller.specUuid
                                                                .value =
                                                            category.uuid!;
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: category
                                                                        .name ==
                                                                    controller
                                                                        .selectedSpecialities
                                                                        .value
                                                                ? AppColors
                                                                    .mainColor
                                                                : AppColors
                                                                    .whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                width: 1,
                                                                color: AppColors
                                                                    .mainColor)),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  screenWidth(
                                                                      30)),
                                                          child: CustomText(
                                                            text: category.name,
                                                            textColor: category
                                                                        .name ==
                                                                    controller
                                                                        .selectedSpecialities
                                                                        .value
                                                                ? AppColors
                                                                    .whiteColor
                                                                : AppColors
                                                                    .mainColor,
                                                            styleType:
                                                                TextStyleType
                                                                    .BODY,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          CustomText(
                                            text: "النوع",
                                            textColor: AppColors.blackColor,
                                          ),
                                          Obx(
                                            () => SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: controller.kind
                                                    .map((category) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller.selectedKind
                                                            .value = category;
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: category ==
                                                                    controller
                                                                        .selectedKind
                                                                        .value
                                                                ? AppColors
                                                                    .mainColor
                                                                : AppColors
                                                                    .whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                width: 1,
                                                                color: AppColors
                                                                    .mainColor)),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  screenWidth(
                                                                      30)),
                                                          child: CustomText(
                                                            text: category,
                                                            textColor: category ==
                                                                    controller
                                                                        .selectedKind
                                                                        .value
                                                                ? AppColors
                                                                    .whiteColor
                                                                : AppColors
                                                                    .mainColor,
                                                            styleType:
                                                                TextStyleType
                                                                    .BODY,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                top: screenWidth(20)),
                                            child: InkWell(
                                                onTap: () {
                                                  Get.off(CollageView(
                                                      speUuid: controller
                                                          .specUuid.value!,
                                                      collegeName: controller
                                                              .listCollege[
                                                                  index]
                                                              .name ??
                                                          '',
                                                      kind: controller
                                                          .selectedKind.value));
                                                },
                                                child:
                                                    CustomBotton(text: "حفظ")),
                                          ),
                                        ],
                                      )),
                                    ));
                            },
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Image.asset(
                                  //     'assets/images/pngs/${controller.imageCollege[index]}.png'),
                                  Image.network(controller
                                      .filteredColleges[index].image
                                      .toString()),
                                  CustomText(
                                    text:
                                        controller.filteredColleges[index].name,
                                    textColor: controller
                                                .filteredColleges[index]
                                                .collegeUuid ==
                                            storege.getCollegeUuid()
                                        ? AppColors.blueColor
                                        : AppColors.blackColor,
                                    styleType: TextStyleType.BODY,
                                  ),
                                ]),
                          );
                        },
                      ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
