import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_botton.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/edit_person_view/edit_person_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  final EditPersonController controller = Get.put(EditPersonController());
  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: ,
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            TitleWiget(svg: "ic_profile", text: "تعديل المعلومات الشخصية"),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
              child: CustomText(text: "اسم المستخدم"),
            ),
            Padding(
              padding: EdgeInsetsDirectional.all(screenWidth(20)),
              child: Obx(() {
                print('${controller.cont.value}');
                return CustomTextFeild(
                  color: AppColors.mainColor,
                  // hintText: "${controller.user.name}",
                  validator: (value) {
                    if (value!.isEmpty)
                      return "ادخل اسم المستخدم";
                    else if (!isUsernameValid(value))
                      return "صيغة خاطئة";
                    else
                      return null;
                  },
                  controller: controller.usernameController
                    ..text = controller.user.name.toString(),
                  prfixPhoto: "ic_profile",
                  sufixPhoto: "ic_edit",
                );
              }),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: screenWidth(20), bottom: screenWidth(20)),
              child: CustomText(
                text: "رقم الهاتف ",
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: screenWidth(20),
                end: screenWidth(20),
              ),
              child: Obx(() {
                print("${controller.cont}");

                return CustomTextFeild(
                  // hintText: "${controller.user.phone}",
                  prfixPhoto: "ic_phone",
                  controller: controller.phoneNumberController
                    ..text = controller.user.phone.toString(),
                  sufixPhoto: "ic_edit",

                  validator: (value) {
                    if (value!.isEmpty)
                      return "ادخل رقم الهاتف";
                    else if (!isTenDigits(value))
                      return "09########الرقم من الشكل";
                    else
                      return null;
                  },
                  color: AppColors.mainColor,
                );
              }),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(1.5),
                  start: screenWidth(20),
                  bottom: screenWidth(30),
                  end: screenWidth(20)),
              child: InkWell(
                  onTap: () {
                    if (controller.formKey.currentState?.validate() ?? false) {
                      controller.editUserInfo(
                          name: controller.usernameController.text,
                          phone: controller.phoneNumberController.text);
                    }
                  },
                  child: CustomBotton(text: "حفظ التغييرات")),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: CustomText(
                  text: "تراجع",
                  textDecoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
