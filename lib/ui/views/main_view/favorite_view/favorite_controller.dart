import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/network/moduls/import_question_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/question_model.dart';
import 'package:darrebni_exam/core/data/repository/user_repository.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  @override
  void onInit() {
    getImportQustion();
    super.onInit();
  }

  RxInt conter = 0.obs;
  RxBool isExpadned = false.obs;
  RxList<importQuestionModel> importQuestion = <importQuestionModel>[].obs;
  RxList<QuestionModel> detailsQuestion = <QuestionModel>[].obs;

  RxInt? expandedIndex = (-1).obs;
  void getImportQustion() async {
    final result = await UserRepository().getImportQuestion();
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      // BotToast.showText(text: 'تم بنجاح');

      importQuestion.clear();
      importQuestion.addAll(r);
    });
  }

  void showImportQustion({required queUuid}) async {
    final result =
        await UserRepository().showImortantQuestion(queUuid: queUuid);
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      // BotToast.showText(text: 'تم بنجاح');

      detailsQuestion.clear();
      detailsQuestion.addAll(r);
    });
  }
}
