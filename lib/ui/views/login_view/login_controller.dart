import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/repository/user_repository.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController codeController = TextEditingController(text: '');
  RxBool isLoading = false.obs;
  void Login({
    required String code,
    required String name,
  }) async {
    final result = await UserRepository().logIn(name: name, code: code);
    result.fold((l) {
      BotToast.showText(text: l);
      isLoading.value = false;
    }, (r) {
      BotToast.showText(text: "تم تسجيل الدخول بنجاح");
      storege.setTokenInfo(r);
      isLoading.value = false;

      return (r);
    });
  }
}
