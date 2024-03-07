import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/network/moduls/college_model.dart';
import 'package:darrebni_exam/core/data/repository/college_repository.dart';
import 'package:darrebni_exam/core/data/repository/user_repository.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SinupController extends GetxController {
  @override
  void onInit() {
    // connectivityService.connectivityStatusController.stream.listen((event) {
    //   isOnline = event == ConnectivityStatus.ONLINE;
    // });
    if (isOnline) {
      getCollege();
    } else
      BotToast.showText(text: 'انت غير متصل');
    super.onInit();
  }

  RxInt index = 0.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  var listCollege = <CollegeModel>[].obs;
  TextEditingController usernameController =
      TextEditingController(text: 'Majd khalil');
  TextEditingController phoneNumberController =
      TextEditingController(text: '0999999999');
  RxInt selectedCategoryIndex = 1.obs;
  void getCollege() async {
    final result = await CollegeRepository().getCollegeName();
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      listCollege.clear();
      listCollege.addAll(r);
    });
  }

  void sinUp(
      {required String uuid,
      required String name,
      required String phoneNumber}) async {
    final result = await UserRepository()
        .sinUp(college_uuid: uuid, name: name, phone: phoneNumber);
    result.fold((l) {
      BotToast.showText(text: l);
      isLoading.value = false;
    }, (r) {
      BotToast.showText(text: r);
      isLoading.value = false;
    });
  }
}
