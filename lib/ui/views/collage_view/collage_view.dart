import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_carouse.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_dots.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text_field_search.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/custom_container.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/collage_view/collage_controller.dart';
import 'package:darrebni_exam/ui/views/exam_cources_view/exam_cources_view.dart';
import 'package:darrebni_exam/ui/views/question_view/question_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollageView extends StatelessWidget {
  final CollegeController controller;
  final String kind;
  final String speUuid;
  final String collegeName;
  CollageView({
    Key? key,
    required this.kind,
    required this.collegeName,
    required this.speUuid,
  })  : controller = Get.put(CollegeController(specilaitUuid: speUuid)),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    print('$speUuid');

    return Scaffold(
      appBar: null,
      body: ListView(children: [
        TitleWiget(
            svg: "ic_vector",
            text: "${collegeName}",
            color: kind == 'ماستر' ? AppColors.blueColor : AppColors.mainColor),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child: Column(
            children: [
              CustomSearch(),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(20), bottom: screenWidth(30)),
                child: CustomCarous(
                  images: controller.listImageCarous,
                  width: screenWidth(1.2),
                  height: screenWidth(2.5),
                  onPageChanged: (index, reason) {
                    controller.updateCurrentIndex(index);
                  },
                ),
              ),
              Obx(() {
                return CustomDots(
                  dotsCount: controller.listImageCarous.length,
                  position: controller.currentIndex.value,
                );
              }),
              CustomContainer(
                text: "التصنيفات",
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: screenWidth(20)),
                  child: Obx(
                    () => Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: List<Widget>.generate(
                        controller.listSubject.length,
                        (index) => InkWell(
                            onTap: () {
                              // controller.subjUuid.value =
                              //     controller.listSubject[index].uuid;
                              // controller.selectedCategoryIndex.value = index;
                              if (controller.selectedCategoryIndex.value ==
                                  index) {
                                // إذا كان الخيار المحدد مطابقًا للخيار الحالي، قم بإزالة الاختيار
                                controller.subjUuid.value =
                                    "null"; // أو قيمة افتراضية أخرى حسب الحاجة
                                controller.selectedCategoryIndex.value =
                                    -1; // أو قيمة افتراضية أخرى حسب الحاجة
                              } else {
                                // إذا كان الخيار الجديد مختلفًا، قم بتحديث القيم
                                controller.subjUuid.value =
                                    controller.listSubject[index].uuid;
                                controller.selectedCategoryIndex.value = index;
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.selectedCategoryIndex.value ==
                                        index
                                    ? AppColors.mainColor
                                    : AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: AppColors.mainColor),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth(30)),
                                child: CustomText(
                                  text: controller.listSubject[index].name,
                                  textColor:
                                      controller.selectedCategoryIndex.value ==
                                              index
                                          ? AppColors.whiteColor
                                          : AppColors.mainColor,
                                  styleType: TextStyleType.BODY,
                                ),
                              ),
                            )),
                      ),
                    ),
                  )),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Divider(
                      color: AppColors.blackColor,
                      endIndent: 10,
                      thickness: 2,
                      height: 1,
                      indent: 2,
                    ),
                  ),
                  CustomText(text: 'او'),
                  Flexible(
                    flex: 1, // Adjust the flex value as needed
                    child: Divider(
                      color: AppColors.blackColor,
                      endIndent: 10,
                      thickness: 2,
                      height: 1,
                      indent: 2,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(20), bottom: screenWidth(20)),
                child: Obx(() => controller.listSubject.length != 0
                    ? controller.subjUuid == 'null'
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.dialog(AlertDialog(
                                      content: SingleChildScrollView(
                                          child: Column(
                                        children: [
                                          CustomText(
                                            text:
                                                'اذا كنت تريد تجربة الامتحان عليك بالدورات  \nاو جرب اسئلة الكتاب',
                                            align: TextAlign.center,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      top: screenWidth(20),
                                                      bottom: screenWidth(20)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.off(QuestionView(
                                                          type: 'byspec',
                                                          kind: kind,
                                                          questionKind:
                                                              'اسئلة الكتاب',
                                                          speUuid: speUuid));
                                                    },
                                                    child: CustomBotton(
                                                        text: 'اسئلة الكتاب',
                                                        width: screenWidth(4)),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.off(ExamCourcesView(
                                                          degree: kind ==
                                                                  'ماستر'
                                                              ? 'master'
                                                              : 'graduation',
                                                          speUuid: speUuid));
                                                    },
                                                    child: CustomBotton(
                                                      text: 'الدورات',
                                                      width: screenWidth(4),
                                                      color:
                                                          AppColors.blueColor,
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ],
                                      )),
                                    ));
                                  },
                                  child: CustomBotton(
                                      text: ' بنك الأسئلة',
                                      width: screenWidth(4))),
                              InkWell(
                                onTap: () {
                                  Get.off(ExamCourcesView(
                                      degree: kind == 'ماستر'
                                          ? 'master'
                                          : 'graduation',
                                      speUuid: speUuid));
                                },
                                child: CustomBotton(
                                  text: 'الدورات',
                                  width: screenWidth(4),
                                  color: AppColors.blueColor,
                                ),
                              )
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              Get.to(() => QuestionView(
                                  kind: kind,
                                  questionKind: 'الاسئلة',
                                  speUuid: speUuid,
                                  subjUuid:
                                      '${controller.listSubject[controller.selectedCategoryIndex.value].uuid}',
                                  type: 'bysubj'));
                            },
                            child: CustomBotton(
                              text:
                                  'اسئلة ${controller.listSubject[controller.selectedCategoryIndex.value].name}',
                              width: screenWidth(4),
                              color: AppColors.blueColor,
                            ),
                          )
                    : SizedBox()),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
