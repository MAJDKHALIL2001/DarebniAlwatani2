import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/views/main_view/main_view_wigdets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BottomNavigationEnum {
  HOME,
  FAVORITE,
  NOTIFICATION,
  DETAIlS,
}

class CustomNavigationBar extends StatelessWidget {
  final BottomNavigationEnum selected;

  final Function(BottomNavigationEnum, int) mainTap;
  const CustomNavigationBar(
      {super.key, required this.selected, required this.mainTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.mainColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        NavItem(
          svgPath: "assets/images/svgs/ic_home.svg",
          isSelected: selected == BottomNavigationEnum.HOME,
          ontap: () {
            mainTap(BottomNavigationEnum.HOME, 0);
          },
        ),
        NavItem(
            svgPath: "assets/images/svgs/ic_star.svg",
            isSelected: selected == BottomNavigationEnum.FAVORITE,
            ontap: () {
              mainTap(BottomNavigationEnum.FAVORITE, 1);
            }),
        NavItem(
            svgPath: "assets/images/svgs/ic_notification.svg",
            isSelected: selected == BottomNavigationEnum.NOTIFICATION,
            ontap: () {
              mainTap(BottomNavigationEnum.NOTIFICATION, 2);
            }),
        NavItem(
            svgPath: "assets/images/svgs/ic_user.svg",
            isSelected: selected == BottomNavigationEnum.DETAIlS,
            ontap: () {
              mainTap(BottomNavigationEnum.DETAIlS, 3);
            }),
      ]),
    );
  }
}

