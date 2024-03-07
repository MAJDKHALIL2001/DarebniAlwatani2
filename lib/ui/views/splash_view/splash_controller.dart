import 'package:darrebni_exam/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    reload();
    super.onInit();
  }

  void reload() {
    Future.delayed(Duration(seconds: 4)).then((value) => Get.off(LoginView()));
  }
}
