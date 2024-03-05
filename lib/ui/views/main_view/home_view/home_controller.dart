import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/network/moduls/college_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/subject_model.dart';
import 'package:darrebni_exam/core/data/repository/college_repository.dart';
import 'package:darrebni_exam/core/data/repository/user_repository.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';

class HomeContorller extends GetxController {
  @override
  void onInit() {
    getCollege();
    getSpecialities();

    super.onInit();
  }

  List<String> images = ['info', 'Login', 'nurs'];
  RxInt index = 0.obs;
  var filteredColleges = [].obs;
  // var listGategories =
  //     <String>["الكل", "الكليات الهندسية", "الكليات الطبية"].obs;
  RxString selectedCategory = 'الكل'.obs;
  late Rx<String?> selectedSpecialities = listSpecialities[0].name.obs;

  RxString selectedKind = 'ماستر'.obs;

  var listCollege = <CollegeModel>[].obs;
  var listSpecialities = <SubjectModel>[].obs;
  RxInt currentIndex = 0.obs;
  var listImageCarous = <String>['Arch', 'DR', 'It'].obs;
  RxSet<String> addedTypes = Set<String>().obs;
  late Rx<String?> specUuid = listSpecialities[0].uuid.obs;
  // var listCollege = <String>[
  //   "طب بشري",
  //   " طب الاسنان",
  //   "صيدلة ",
  //   'تمريض',
  //   "هندسة معلوماتية",
  //   "هندسة معمارية"
  // ].obs;
  var categoris = <String>[
    "هندسة البرمجيات ",
    "شبكات",
    "الذكاء الصنعي",
  ].obs;
  var kind = <String>[
    "ماستر",
    "تخرج",
  ].obs;
  // var imageCollege = <String>[
  //   "DR",
  //   "Dentist",
  //   "Pharmacy",
  //   "Nurse",
  //   "It",
  //   "Arch",
  // ].obs;

  void filterColleges() {
    if (selectedCategory.value == 'الكل') {
      filteredColleges.value = listCollege;
    } else {
      filteredColleges.value = listCollege
          .where((college) => college.type == selectedCategory.value)
          .toList();
    }
  }

  void addTypesToSet() {
    addedTypes.add('الكل');
    for (var college in listCollege) {
      addedTypes.add(college.type ?? '');
    }
  }

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void getCollege() async {
    final result = await CollegeRepository().getCollegeName();
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      listCollege.clear();
      listCollege.addAll(r);

      addTypesToSet();
      filterColleges();
    });
  }

  void getSpecialities() async {
    final result = await CollegeRepository().getSpecialities();
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      // BotToast.showText(text: 'تم بنجاح');

      listSpecialities.clear();
      listSpecialities.addAll(r);
    });
  }
}
