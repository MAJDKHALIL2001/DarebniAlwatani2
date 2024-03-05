import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';

enum MessageType {
  INFO,
  ERROR,
  SUCCESS,
  ALERT,
}

class CustomToast {
  static showMessage({
    required String message,
    MessageType? type = MessageType.INFO,
  }) {
    String imageName = 'info';
    Color shadowColor = AppColors.blueColor;

    switch (type) {
      case MessageType.INFO:
        imageName = 'info';
        shadowColor = AppColors.blueColor;
        break;
      case MessageType.ERROR:
        imageName = 'rejected-01';
        shadowColor = AppColors.redColor;
        break;
      case MessageType.SUCCESS:
        imageName = 'approved1-01';
        shadowColor = AppColors.greenColor;
        break;
      case MessageType.ALERT:
        imageName = 'warning';
        shadowColor = AppColors.yellowColor;
        break;

      default:
        imageName = 'info';
        shadowColor = AppColors.blueColor;
        break;
    }

    BotToast.showCustomText(
        duration: Duration(seconds: 15),
        toastBuilder: (value) {
          return Card(
            elevation: 10,
            shadowColor: shadowColor,
            margin: EdgeInsets.all(screenWidth(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/images/svgs/$imageName.svg',
                  width: screenWidth(10),
                  height: screenWidth(10),
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: screenWidth(18), color: AppColors.blackColor),
                )
              ],
            ),
          );
        });
  }
}
