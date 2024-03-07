import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/network/moduls/answer_import_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/import_question_model.dart';
import 'package:darrebni_exam/core/data/repository/user_repository.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  @override
  onInit() {
    storege.getFirstLunch()
        ? null
        : {
            if (isOnline)
              getImportQustion()
            else
              BotToast.showText(text: 'انت غير متصل'),
          };
    super.onInit();
  }

  RxInt conter = 0.obs;
  RxBool isExpadned = false.obs;
  RxList<importQuestionModel> importQuestion = <importQuestionModel>[].obs;
  RxList<AnswerImportModel> detailsQuestion = <AnswerImportModel>[].obs;
  AnswerImportModel answerImportModel = AnswerImportModel();
  RxInt? expandedIndex = (-1).obs;
  RxBool? showLoader = false.obs;
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
      showLoader!.value = false;

      BotToast.showText(text: l);
    }, (r) {
      // BotToast.showText(text: 'تم بنجاح');
      answerImportModel = r;
      showLoader!.value = false;
      // detailsQuestion.clear();
      // detailsQuestion.addAll(r);
      // BotToast.showText(text: '${answerImportModel.favorite}');
    });
  }

  deletFavoritQuestion({required String uuid}) async {
    final result = await UserRepository().deleteFavoritQuestion(
      uuid: uuid,
    );
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      BotToast.showText(text: r);
    });
  }
}
