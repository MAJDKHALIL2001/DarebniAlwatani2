import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/exam_cources_view/exam_cources_controller.dart';
import 'package:darrebni_exam/ui/views/question_view/question_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ExamCourcesView extends StatelessWidget {
  final String degree;
  final String speUuid;
  late final ExamCourcesController controller;
  ExamCourcesView({super.key, required this.degree, required this.speUuid}) {
    controller =
        Get.put(ExamCourcesController(degree: degree, speUuid: speUuid));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.onInit();
        },
        child: ListView(
          children: [
            TitleWiget(
                svg: "ic_vector",
                text: "الدورات",
                color: degree == 'master'
                    ? AppColors.blueColor
                    : AppColors.mainColor),
            Obx(
              () => controller.listExam.length == 0
                  ? SpinKitCircle(
                      color: degree == 'master'
                          ? AppColors.blueColor
                          : AppColors.mainColor,
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.listExam.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(screenWidth(30)),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => QuestionView(
                                  kind: degree == 'master' ? "ماستر" : 'تخرج',
                                  questionKind: controller.listExam[index].name
                                      .toString(),
                                  type: 'bycourse',
                                  examUid: controller.listExam[index].examUuid,
                                  speUuid: speUuid));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index % 2 == 0
                                    ? AppColors.mainColorLowOp
                                    : AppColors.blueColorLowOp,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth(40)),
                                child: Row(children: [
                                  SvgPicture.asset(
                                    "assets/images/svgs/ic_book.svg",
                                    color: AppColors.blackColor,
                                  ),
                                  CustomText(
                                      text:
                                          "   ${controller.listExam[index].name}",
                                      textColor: AppColors.blackColor,
                                      styleType: TextStyleType.SUBTITLE),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_right_outlined,
                                    size: screenWidth(10),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
