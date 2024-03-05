import 'package:bot_toast/bot_toast.dart';
import 'package:darrebni_exam/core/data/repository/user_repository.dart';
import 'package:get/get.dart';

import '../../../../core/data/network/moduls/notification_model.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    getNotification();
    super.onInit();
  }

  RxList<NotifictionModel> listNotification = <NotifictionModel>[].obs;

  getNotification() async {
    final result = await UserRepository().getNotification();
    result.fold((l) {
      BotToast.showText(text: l);
    }, (r) {
      // BotToast.showText(text: 'تم بنجاح');

      listNotification.clear();
      listNotification.addAll(r);
    });
  }
}
