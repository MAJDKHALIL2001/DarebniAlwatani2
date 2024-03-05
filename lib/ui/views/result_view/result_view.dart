import 'package:darrebni_exam/core/data/network/moduls/question_model.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/result_view/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultView extends StatefulWidget {
  final RxMap<String, int> selectedAnswer;
  final RxList<QuestionModel> questionsList;
  final String kind;
  final ResultController controller;
  ResultView(
      {super.key,
      required this.selectedAnswer,
      required this.questionsList,
      required this.kind})
      : controller = Get.put(ResultController(
            selectedAnswers: selectedAnswer, questionList: questionsList));

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        TitleWiget(
          svg: "ic_vector",
          text: "النتيجة",
          color: widget.kind == 'ماستر'
              ? AppColors.blueColor
              : AppColors.mainColor,
        ),
        CustomText(
            text:
                'عدد الاجابات الصحيحة:${widget.controller.correctAnswersCount.value} / ${widget.controller.questionList.length}'),
        CustomText(
            text:
                'عدد الاجابات الخاطئة:${widget.controller.questionList.length - widget.controller.correctAnswersCount.value} / ${widget.controller.questionList.length}'),
        InkWell(
            onTap: () {
              widget.controller.showResult.value = true;
              setState(() {});
              ;
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(30)),
              child: CustomBotton(
                text: 'التحقق من الاجابات',
                color: widget.kind == 'ماستر'
                    ? AppColors.blueColor
                    : AppColors.mainColor,
              ),
            )),
        !widget.controller.showResult.value
            ? SizedBox()
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.controller.questionList.length,
                itemBuilder: (context, queIndex) {
                  return Padding(
                    padding: EdgeInsets.all(screenWidth(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.controller.questionList[queIndex].questionText}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        ...List<Widget>.generate(
                            widget.controller.questionList[queIndex].answers!
                                .length, (index) {
                          return Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                                vertical: screenWidth(30)),
                            child: Container(
                              width: double.infinity,
                              height: screenWidth(6),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.blackColor, width: 1),
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
                                          color:
                                              widget.controller.selectedAnswers[
                                                          widget
                                                              .controller
                                                              .questionList[
                                                                  queIndex]
                                                              .questionText] ==
                                                      index
                                                  ? AppColors.blackColor
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
                                                  ' ${widget.controller.questionList[queIndex].answers![index].answerText}',
                                              textColor: widget.controller.selectedAnswers[widget
                                                              .controller
                                                              .questionList[
                                                                  queIndex]
                                                              .questionText] !=
                                                          index &&
                                                      widget
                                                              .controller
                                                              .questionList[
                                                                  queIndex]
                                                              .answers![index]
                                                              .status ==
                                                          false
                                                  ? AppColors.blackColor
                                                  : widget.controller.selectedAnswers[widget.controller.questionList[queIndex].questionText] != index &&
                                                          widget.controller.questionList[queIndex].answers![index].status ==
                                                              true
                                                      ? AppColors.blueColor
                                                      : widget.controller.selectedAnswers[widget.controller.questionList[queIndex].questionText] ==
                                                                  index &&
                                                              widget
                                                                      .controller
                                                                      .questionList[queIndex]
                                                                      .answers![index]
                                                                      .status ==
                                                                  true
                                                          ? AppColors.blueColor
                                                          : AppColors.redColor)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              ),
      ],
    ));
  }
}
