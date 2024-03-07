import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/network/moduls/user_model.dart';
import 'package:darrebni_exam/core/data/repository/user_repository.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPersonController extends GetxController {
  @override
  void onInit() {
    isOnline ? getUserInfo() : BotToast.showText(text: 'انت غير متصل');
    super.onInit();
  }

  Rx isLoading = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  late userModel user = userModel();
  RxInt cont = 0.obs;
  void getUserInfo() async {
    final result = await UserRepository().getUserInfo();
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      // BotToast.showText(text: 'تم بنجاح');
      // return (r);
      user = r;
      // listSpecialities.clear();
      // listSpecialities.addAll(r);
      cont++;
    });
  }

  void editUserInfo({required name, required phone}) async {
    final result =
        await UserRepository().editUserDetails(name: name, phone: phone);
    result.fold((l) {
      isLoading.value = false;
      BotToast.showText(text: l);
    }, (r) {
      BotToast.showText(text: r);
      isLoading.value = false;

      // BotToast.showText(text: 'تم بنجاح');
      // return (r);
      // listSpecialities.clear();
      // listSpecialities.addAll(r);
      // cont++;
    });
  }
}
