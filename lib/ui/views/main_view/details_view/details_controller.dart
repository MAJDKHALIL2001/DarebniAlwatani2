import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/repository/user_repository.dart';

class DetailsController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool isLoadingLogout = false.obs;
  TextEditingController suggestController = TextEditingController();
  void Logout() async {
    final result = await UserRepository().logOut();
    result.fold((l) {
      BotToast.showText(text: l);
      isLoadingLogout.value = false;
    }, (r) {
      BotToast.showText(text: r);
      isLoadingLogout.value = false;

      return (r);
    });
  }

  void addSuggest({required String text}) async {
    final result = await UserRepository().addSuggestion(text: text);
    result.fold((l) {
      BotToast.showText(text: l);
      isLoading.value = false;
    }, (r) {
      BotToast.showText(text: r);
      isLoading.value = false;

      return (r);
    });
  }
}
