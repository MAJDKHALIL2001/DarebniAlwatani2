import 'package:darrebni_exam/core/data/network/moduls/question_model.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  @override
  void onInit() {
    updateCorrectAnswersCount();
    super.onInit();
  }

  late RxMap<String, int> selectedAnswers;
  late RxList<QuestionModel> questionList;
  RxBool showResult = false.obs;
  RxInt queIndex = 0.obs;
  RxInt correctAnswersCount = 0.obs;
  ResultController({required this.selectedAnswers, required this.questionList});

  // updateCorrectAnswersCount(int index, int queIndex) {
  //   if (selectedAnswers[questionList[queIndex].questionText] == index &&
  //       questionList[queIndex].answers![index].status == true) {
  //     correctAnswersCount++;
  //   }
  // }
  void updateCorrectAnswersCount() {
    for (int queIndex = 0; queIndex < questionList.length; queIndex++) {
      for (int index = 0;
          index < questionList[queIndex].answers!.length;
          index++) {
        if (selectedAnswers[questionList[queIndex].questionText] == index &&
            questionList[queIndex].answers![index].status == true) {
          correctAnswersCount++;
        }
      }
    }
  }
}
