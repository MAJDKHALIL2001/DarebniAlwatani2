import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:darrebni_exam/ui/views/collage_view/collage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:darrebni_exam/core/data/repository/shared_prefrence_repository.dart';
import 'package:darrebni_exam/core/services/connectivity_service.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: AppColors.mainColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: screenWidth(4),
        height: screenWidth(4),
        child: SpinKitCircle(
          color: AppColors.blackColor,
          size: screenWidth(8),
        ),
      );
    });
bool isValidEntryCode(String code) {
  final RegExp pattern = RegExp(r'^.{6}$');
  return pattern.hasMatch(code);
}

bool isTenDigits(String input) {
  return RegExp(r'^09\d{8}$').hasMatch(input);
}

bool isUsernameValid(String username) {
  return RegExp(r'^[a-zA-Z\s]+$').hasMatch(username);
}
// bool isEmailValid(String email) {
//   return RegExp(
//           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//       .hasMatch(email);
// }

// bool isValidPassword(String password) {
//   return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
//       .hasMatch(password);
// }

Future<XFile?> chooseImage(ImageSource imageSource) async {
  return await ImagePicker().pickImage(source: imageSource);
}

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.height / percent;
  else
    return Get.size.width / percent;
}

Future<void> setStatusBarColor(Color color) async {
  await FlutterStatusbarcolor.setStatusBarColor(color);
}

SharedPrefrenceRepository get storege => Get.find<SharedPrefrenceRepository>();

ConnectivityService get connectivityService => Get.find<ConnectivityService>();
Connectivity get connectivity => Get.find<Connectivity>();

bool isOnline = false;
