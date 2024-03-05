import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/network/moduls/user_model.dart';
import 'package:darrebni_exam/core/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPersonController extends GetxController {
  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }

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
      BotToast.showText(text: l);
    }, (r) {
      BotToast.showText(text: r);

      // BotToast.showText(text: 'تم بنجاح');
      // return (r);
      // listSpecialities.clear();
      // listSpecialities.addAll(r);
      // cont++;
    });
  }
}
