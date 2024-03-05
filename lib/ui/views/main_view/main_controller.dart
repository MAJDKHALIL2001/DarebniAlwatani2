import 'package:darrebni_exam/ui/views/main_view/main_view_wigdets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  PageController pagercontroller = PageController();
  var selectedView = BottomNavigationEnum.HOME.obs;

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
  }

  // void toggleAllproduct() {
  //   selectedView.value = BottomNavigationEnum.PRODUCT;
  //   pagercontroller.jumpToPage(0);
  // }

  void togglemainTap(BottomNavigationEnum selecteEnum, int index) {
    selectedView.value = selecteEnum;
    pagercontroller.jumpToPage(index);
  }
}
