import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/main_view/favorite_view/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class FavoriteView extends StatefulWidget {
  FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final FavoriteController controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.onInit();
        },
        child: ListView(
          children: [
            TitleWiget(svg: "ic_vector", text: "الأسئلة المهمة"),
            Obx(
              () => ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.importQuestion.length,
                itemBuilder: (BuildContext context, int qIndex) {
                  return Padding(
                    padding: EdgeInsets.all(screenWidth(30)),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              isOnline
                                  ? {
                                      controller.showImportQustion(
                                          queUuid: controller
                                              .importQuestion[qIndex].uuid),
                                      controller.showLoader!.value = true,
                                      Get.dialog(Obx(
                                        () => AlertDialog(
                                          content: SingleChildScrollView(
                                            child: controller.showLoader!.value
                                                ? SpinKitCircle(
                                                    color: AppColors.mainColor,
                                                  )
                                                : Column(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: AppColors
                                                                .blueColorD1),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  screenWidth(
                                                                      40)),
                                                          child: Wrap(
                                                            children: [
                                                              CustomText(
                                                                  text:
                                                                      "${controller.answerImportModel.questionText}"),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          children:
                                                              List.generate(
                                                            controller
                                                                    .answerImportModel
                                                                    .answers
                                                                    ?.length ??
                                                                0,
                                                            (index) {
                                                              return Padding(
                                                                padding: EdgeInsets.all(
                                                                    screenWidth(
                                                                        30)),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: controller.answerImportModel.answers![index].status ==
                                                                            true
                                                                        ? AppColors
                                                                            .greenColor
                                                                        : AppColors
                                                                            .whiteColor,
                                                                    border: Border.all(
                                                                        width:
                                                                            1,
                                                                        color: controller.answerImportModel.answers![index].status ==
                                                                                true
                                                                            ? AppColors.greenColor
                                                                            : AppColors.redColor),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.all(
                                                                        screenWidth(
                                                                            40)),
                                                                    child: Wrap(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(screenWidth(30)),
                                                                          child:
                                                                              CustomText(text: "${controller.answerImportModel.answers![index].answerText}"),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                          ),
                                        ),
                                      ))
                                    }
                                  : BotToast.showText(text: 'انت غير متصل');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.blueColorD1),
                              child: Wrap(children: [
                                Padding(
                                  padding: EdgeInsets.all(screenWidth(30)),
                                  child: CustomText(
                                      text:
                                          '${controller.importQuestion[qIndex].questionText}'),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth(30)),
                          child: InkWell(
                            onTap: () {
                              isOnline
                                  ? {
                                      controller.deletFavoritQuestion(
                                          uuid: controller
                                              .importQuestion[qIndex].uuid
                                              .toString()),
                                      controller.importQuestion.removeAt(qIndex)
                                    }
                                  : BotToast.showText(text: 'انت غير متصل');
                            },
                            child: Icon(
                              Icons.highlight_remove_rounded,
                              color: AppColors.redColor,
                            ),
                          ),
                        ),
                      ],
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
// '${controller.detailsQuestion[qIndex].answers![answerIndex].answerText}'
