import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/question_view/question_controller.dart';
import 'package:darrebni_exam/ui/views/result_view/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuestionView extends StatelessWidget {
  final QuestionController controller;
  final String kind;
  final String questionKind;
  final String speUuid;
  final String? examUid;
  final String? subjUuid;
  final String type;
  QuestionView({
    super.key,
    required this.kind,
    required this.questionKind,
    required this.speUuid,
    this.examUid,
    this.subjUuid,
    required this.type,
  }) : controller = Get.put(QuestionController(
            subjUuid: subjUuid,
            specialityUuid: speUuid,
            type: type,
            examUuid: examUid));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView(
          children: [
            Stack(
              children: [
                TitleWiget(
                  svg: "ic_vector",
                  text: "${questionKind}",
                  color: kind == 'ماستر'
                      ? AppColors.blueColor
                      : AppColors.mainColor,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: screenWidth(40),
                      end: screenWidth(40),
                      top: screenWidth(3),
                      bottom: screenWidth(30)),
                  child: (controller.questionList.length == 0)
                      ? SpinKitCircle(
                          color: AppColors.mainColor,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                                  '${controller.questionList.length}/${controller.counter.value}',
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: screenWidth(30)),
                              child: LinearPercentIndicator(
                                lineHeight: 5,
                                percent: controller.progressPercent.value,
                                backgroundColor: AppColors.blueColor,
                                progressColor: AppColors.mainColor,
                              ),
                            ),
                            CustomText(
                                text:
                                    '${controller.questionList[controller.counter.value - 1].questionText}'),
                            ...List<Widget>.generate(
                                controller.questionList.isNotEmpty &&
                                        controller.counter.value - 1 <
                                            controller.questionList.length
                                    ? controller
                                        .questionList[
                                            controller.counter.value - 1]
                                        .answers!
                                        .length
                                    : 0, (index) {
                              // Inside the List<Widget>.generate method
// Inside the List<Widget>.generate method
                              return Padding(
                                padding: EdgeInsetsDirectional.symmetric(
                                    vertical: screenWidth(30)),
                                child: InkWell(
                                  onTap: () {
                                    if (controller.answerSelectionStatus[
                                            controller.counter.value - 1] ==
                                        true) {
                                      return null;
                                    }
                                    controller.updateQuestionText();
                                    controller.onAnswerSelected(index);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: screenWidth(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.blackColor,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(screenWidth(20)),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                end: screenWidth(20)),
                                            child: Container(
                                              width: screenWidth(20),
                                              height: screenWidth(20),
                                              decoration: BoxDecoration(
                                                color: controller
                                                                .selectedAnswers[
                                                            controller
                                                                .questionText
                                                                .value] ==
                                                        index
                                                    ? AppColors.blackColorLowOp
                                                    : AppColors.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                border: Border.all(
                                                    color: AppColors.blackColor,
                                                    width: 1),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Wrap(
                                              children: [
                                                CustomText(
                                                    text:
                                                        ' ${controller.questionList[controller.counter.value - 1].answers![index].answerText}',
                                                    textColor: controller
                                                                    .answerSelectionStatus[
                                                                controller
                                                                        .counter
                                                                        .value -
                                                                    1] ==
                                                            true
                                                        ? (controller
                                                                    .questionList[
                                                                        controller.counter.value -
                                                                            1]
                                                                    .answers![
                                                                        index]
                                                                    .status ==
                                                                true
                                                            ? AppColors
                                                                .blueColor
                                                            : AppColors
                                                                .redColor)
                                                        : AppColors.blackColor),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    isOnline
                                        ? {
                                            controller
                                                        .questionList[controller
                                                                .counter.value -
                                                            1]
                                                        .favorite ==
                                                    0
                                                ? {
                                                    controller.addFavoritQuestion(
                                                        question: controller
                                                            .questionList[
                                                                controller
                                                                        .counter
                                                                        .value -
                                                                    1]
                                                            .question
                                                            .toString()),
                                                    controller
                                                        .questionList[controller
                                                                .counter.value -
                                                            1]
                                                        .favorite = 1,
                                                    controller.isFavorit!
                                                        .value = true,
                                                  }
                                                : BotToast.showText(
                                                    text:
                                                        'السؤال موجود بالمفضلة مسبقا')
                                          }
                                        : BotToast.showText(
                                            text: 'انت غير متصل');
                                  },
                                  child: controller.isFavorit!.value
                                      ? Icon(
                                          Icons.star,
                                          color: AppColors.yellowColor,
                                        )
                                      : Icon(
                                          controller
                                                      .questionList[controller
                                                              .counter.value -
                                                          1]
                                                      .favorite ==
                                                  0
                                              ? Icons.star_border
                                              : Icons.star,
                                          color: AppColors.yellowColor,
                                        ),
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.answerSelectionStatus[
                                          controller.counter.value - 1] = true;

                                      // controller.isCorrect.value =
                                      //     !controller.isCorrect.value;
                                    },
                                    child: Icon(
                                      controller.answerSelectionStatus.length >
                                              controller.counter.value - 1
                                          ? (controller.answerSelectionStatus[
                                                  controller.counter.value - 1]
                                              ? Icons.check_box
                                              : Icons.check_box_outlined)
                                          : Icons.check_box_outlined,
                                      color: AppColors.blueColor,
                                    ))
                              ],
                            )
                          ],
                        ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(7),
                  bottom: screenWidth(30),
                  start: screenWidth(20),
                  end: screenWidth(20)),
              child: controller.questionList.length == 0
                  ? SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.deccrementCounter();
                            // controller.updateIsFavorit();
                            controller.isFavorit!.value = false;
                          },
                          child: controller.counter.value != 1
                              ? CustomBotton(
                                  text: 'السابق',
                                  width: screenWidth(5),
                                  color: AppColors.blueColor,
                                )
                              : SizedBox(),
                        ),
                        InkWell(
                            onTap: () {
                              controller.isFavorit!.value = false;

                              controller.incrementCounter();
                            },
                            child: controller.counter.value !=
                                    controller.questionList.length
                                ? CustomBotton(
                                    width: screenWidth(5),
                                    text: 'التالي',
                                  )
                                : InkWell(
                                    onTap: () {
                                      Get.off(() => ResultView(
                                          kind: kind,
                                          selectedAnswer:
                                              controller.selectedAnswers,
                                          questionsList:
                                              controller.questionList));
                                    },
                                    child: CustomBotton(
                                      width: screenWidth(5),
                                      text: 'انهاء',
                                    ),
                                  )),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
