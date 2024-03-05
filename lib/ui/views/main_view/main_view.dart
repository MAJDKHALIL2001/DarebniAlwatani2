import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/main_view/details_view/details_view.dart';
import 'package:darrebni_exam/ui/views/main_view/favorite_view/favorite_view.dart';
import 'package:darrebni_exam/ui/views/main_view/home_view/home_view.dart';
import 'package:darrebni_exam/ui/views/main_view/main_controller.dart';
import 'package:darrebni_exam/ui/views/main_view/main_view_wigdets/bottom_navigation_bar.dart';
import 'package:darrebni_exam/ui/views/main_view/notification_view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController mcontroller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mcontroller.scaffoldkey,
      body: PageView(
          controller: mcontroller.pagercontroller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeView(),
            FavoriteView(),
            NotificationView(),
            DetailsView(),
          ]),
      bottomNavigationBar: Obx(() => Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenWidth(40)),
            child: CustomNavigationBar(
              selected: mcontroller.selectedView.value,
              mainTap: (selecteEnum, index) {
                mcontroller.togglemainTap(selecteEnum, index);
              },
            ),
          )),
    );
  }
}
