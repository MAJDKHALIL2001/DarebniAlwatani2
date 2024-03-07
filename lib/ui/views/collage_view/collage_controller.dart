import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/network/moduls/subject_model.dart';
import 'package:darrebni_exam/core/data/repository/college_repository.dart';
import 'package:darrebni_exam/core/data/repository/user_repository.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';

class CollegeController extends GetxController {
  @override
  void onInit() {
    getSubjects();
    getSliderImage();

    super.onInit();
  }

  TextEditingController searchControlle = TextEditingController();
  var filteredColleges = [].obs;

  CollegeController({required this.specilaitUuid});
  RxString kind = ''.obs;
  late String specilaitUuid;
  // RxList questionKind = <String>['book', 'exam'].obs;
  RxString subjUuid = 'null'.obs;
  RxInt currentIndex = 0.obs;
  late RxInt selectedCategoryIndex = 1000.obs;
  // var listImageCarous = <String>['Arch', 'DR', 'It'].obs;
  RxList listSubject = <SubjectModel>[].obs;
  RxList<String> listImage = <String>[].obs;
  RxBool isloading = true.obs;
  void filterCollegesByName() {
    String searchText = searchControlle.text.trim().toLowerCase();
    if (searchText.isEmpty) {
      filteredColleges.value = listSubject;
    } else {
      filteredColleges.value = listSubject
          .where((college) => college.name!.toLowerCase().contains(searchText))
          .toList();
    }
  }

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void getSubjects() async {
    final result =
        await CollegeRepository().getSubjects(specialityUuuid: specilaitUuid);
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      // BotToast.showText(text: 'تم بنجاح');

      listSubject.clear();
      listSubject.addAll(r);
    });
  }

  getSliderImage() async {
    final result = await UserRepository().getSliderImage(position: 'home');
    result.fold((l) {
      BotToast.showText(text: l);
      isloading.value = false;
    }, (r) {
      // BotToast.showText(text: 'تم بنجاح');
      isloading.value = false;

      listImage.clear();
      listImage.addAll(r[0].url?.map((url) => url.toString()) ?? []);
    });
  }
}
