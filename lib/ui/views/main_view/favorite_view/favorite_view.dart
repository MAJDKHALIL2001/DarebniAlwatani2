import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:darrebni_exam/ui/views/main_view/favorite_view/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteView extends StatefulWidget {
  FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

// class _FavoriteViewState extends State<FavoriteView> {
//   final FavoriteController controller = Get.put(FavoriteController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           TitleWiget(svg: "ic_vector", text: "الأسئلة المهمة"),
//           Obx(
//             () => ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: controller.importQuestion.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ExpansionPanelList(
//                   expansionCallback: (int index, bool isExpanded) {
//                     // يمكنك إضافة التعامل هنا إذا كان مطلوب
//                   },
//                   children: [
//                     ExpansionPanel(
//                       headerBuilder: (BuildContext context, bool isExpanded) {
//                         return ListTile(
//                           title: InkWell(
//                             onTap: () {
//                               controller.isExpadned.value =
//                                   !controller.isExpadned.value;
//                               // setState(() {});
//                             },
//                             child: Text(
//                                 '${controller.importQuestion[index].questionText}'),
//                           ),
//                         );
//                       },
//                       body: Obx(
//                         () => ListView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount:
//                               // controller.importQuestion[index].answers!.length,
//                               controller.importQuestion.length,
//                           itemBuilder: (BuildContext context, int answerIndex) {
//                             return ListTile(
//                               title: Text('majd'),
//                               //  Text(controller.importQuestion[index]
//                               //     .answers![answerIndex].answerText),
//                             );
//                           },
//                         ),
//                       ),
//                       isExpanded: controller.isExpadned
//                           .value, // يمكنك تعديل هذا للتحكم في التوسيع بشكل ديناميكي
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class _FavoriteViewState extends State<FavoriteView> {
  final FavoriteController controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TitleWiget(svg: "ic_vector", text: "الأسئلة المهمة"),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.importQuestion.length,
            itemBuilder: (BuildContext context, int qIndex) {
              return Obx(
                () => ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    controller.expandedIndex!.value =
                        (controller.expandedIndex!.value == qIndex
                            ? -1
                            : qIndex);
                    // controller.showImportQustion(
                    //     queUuid:
                    //         controller.importQuestion[qIndex].uuid.toString());
                    // setState(() {});
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(
                              '${controller.importQuestion[qIndex].questionText}'),
                        );
                      },
                      body: Text('majd'),
                      // body: ListView.builder(
                      //   physics: NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemCount: controller.importQuestion.length,
                      //   itemBuilder: (BuildContext context, int answerIndex) {
                      //     return controller.detailsQuestion[qIndex].answers
                      //                 ?.length ==
                      //             0
                      //         ? ListTile(
                      //             title: controller.detailsQuestion[qIndex]
                      //                         .answers?.length ==
                      //                     0
                      //                 ? CustomText(
                      //                     text:
                      //                         '${controller.detailsQuestion[qIndex].answers![answerIndex].answerText}')
                      //                 : CustomText(text: ''),
                      //           )
                      //         : SizedBox();
                      //   },
                      // ),
                      isExpanded: controller.expandedIndex!.value == qIndex,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
                                  // '${controller.detailsQuestion[qIndex].answers![answerIndex].answerText}'