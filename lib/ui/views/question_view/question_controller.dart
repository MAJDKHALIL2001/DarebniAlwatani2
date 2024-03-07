import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/network/moduls/question_model.dart';
import 'package:darrebni_exam/core/data/repository/exam_repository.dart';
import 'package:darrebni_exam/core/data/repository/user_repository.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  @override
  void onInit() {
    if (type == 'byspec') {
      getQuestionBySpec();
    } else if (type == 'bysubj') {
      getQuestionBySubj();
    } else if (type == 'bycourse') {
      getQuestionByExam();
    }
    updateQuestionText();
    // updateIsFavorit();
    super.onInit();
  }

  // Map<String, int> selectedAnswers = {};
  RxMap<String, int> selectedAnswers = RxMap<String, int>.from({});
  RxList<bool> answerSelectionStatus = RxList<bool>.filled(200, false);
  RxBool? isFavorit = false.obs; // RxBool isCorrect = false.obs;
  // RxBool isChoice = false.obs;
  RxString questionText = ''.obs;

  RxInt selectedAnswerIndex = (-1).obs;
  RxInt counter = 1.obs;
  late String? specialityUuid;
  late String? questionKind;
  late String? subjUuid;
  late String? examUuid;
  late String? type;

  RxList<QuestionModel> questionList = <QuestionModel>[].obs;

  RxDouble progressPercent = 0.0.obs;
  QuestionController(
      {required this.specialityUuid,
      this.examUuid,
      required this.type,
      this.subjUuid}) {
    progressPercent.value = (50 - counter.value) / 50;
  }
  // updateIsFavorit() {
  //   if (questionList.isNotEmpty && counter.value > 0) {
  //     isFavorit!.value = questionList[counter.value - 1].favorite == 1;
  //   }
  // }

  void incrementCounter() {
    if (counter.value < questionList.length) {
      counter++;
      progressPercent.value =
          (questionList.length - counter.value) / questionList.length;
      updateQuestionText();
    }
  }

  void deccrementCounter() {
    if (counter.value > 1) {
      counter--;
      progressPercent.value =
          (questionList.length - counter.value) / questionList.length;
      updateQuestionText();
    }
  }

  getQuestionBySpec() async {
    final result = await ExamRepository().getQuestoinByBook(
        speciality_uuid: '${specialityUuid}',
        // "${college.listSubject[college.selectedCategoryIndex.value].uuid}",
        questionKind: 'book');
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      questionList.clear();
      questionList.addAll(r);
    });
  }

  getQuestionByExam() async {
    final result = await ExamRepository().getExamByExam(
      examUuid: '${examUuid}',
      speciality_uuid: '${specialityUuid}',
    );
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      questionList.clear();
      questionList.addAll(r);
    });
  }

  getQuestionBySubj() async {
    final result =
        await ExamRepository().getExamBySubj(subjUuid: '${subjUuid}');
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      questionList.clear();
      questionList.addAll(r);
    });
  }

  void updateQuestionText() {
    questionText.value = questionList.isNotEmpty && counter.value > 0
        ? questionList[counter.value - 1].questionText ?? 'Default text'
        : 'Default text';
  }

  void onAnswerSelected(int index) {
    if (!selectedAnswers.containsKey(questionText.value)) {
      // إذا لم يكن المفتاح موجودًا، قم بإنشاء قائمة جديدة وتعيينها للمفتاح
      selectedAnswers[questionText.value] = index;
    } else {
      // إذا كان المفتاح موجودًا، قم بالتحقق مما إذا كان القيمة موجودة في القائمة
      if (selectedAnswers[questionText.value] != index) {
        // إذا كان القيمة غير موجودة، قم بتحديث القيمة الحالية
        selectedAnswers[questionText.value] = index;
      } else {
        // إذا كان القيمة موجودة، قم بإزالتها من القائمة
        selectedAnswers.remove(questionText.value);
      }
    }
  }

  addFavoritQuestion({required String question}) async {
    final result = await UserRepository().addFavoritQuestion(
      question: '${question}',
    );
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      BotToast.showText(text: r);
    });
  }
}
