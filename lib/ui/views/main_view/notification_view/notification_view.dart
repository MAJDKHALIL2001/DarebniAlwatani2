import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/main_view/notification_view/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());
  NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      TitleWiget(svg: "ic_vector", text: "الإشعارات"),
      Obx(
        () => ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.listNotification.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(screenWidth(30)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index % 2 == 0
                      ? AppColors.mainColorLowOp
                      : AppColors.blueColorLowOp,
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth(40)),
                  child: Column(
                    children: [
                      CustomText(
                          text:
                              "   ${controller.listNotification[index].title}",
                          textColor: AppColors.blackColor,
                          styleType: TextStyleType.SUBTITLE),
                      CustomText(
                          text: "   ${controller.listNotification[index].body}",
                          textColor: AppColors.blackColor,
                          styleType: TextStyleType.SUBTITLE),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )
    ]);
  }
}
