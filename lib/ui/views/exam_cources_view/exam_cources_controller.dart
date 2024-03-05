import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/network/moduls/exam_model.dart';
import 'package:darrebni_exam/core/data/repository/exam_repository.dart';
import 'package:get/get.dart';

class ExamCourcesController extends GetxController {
  @override
  void onInit() {
    getExameName();
    super.onInit();
  }

  final String speUuid;
  final String degree;
  RxList<ExamModel> listExam = <ExamModel>[].obs;
  ExamCourcesController({required this.speUuid, required this.degree});

  getExameName() async {
    final result = await ExamRepository().getExamCouses(
      degree: degree,
      speciality_uuid: speUuid,
    );
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      // BotToast.showText(text: 'تم بنجاح');

      listExam.clear();
      listExam.addAll(r);
    });
  }
}
