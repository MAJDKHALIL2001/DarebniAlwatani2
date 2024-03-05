// import 'package:darrebni_exam/core/data/network/moduls/common_response.dart';
// import 'package:darrebni_exam/core/data/network/moduls/question_model.dart';
// import 'package:darrebni_exam/core/data/network/network_config.dart';
// import 'package:darrebni_exam/core/enums/request_type.dart';
// import 'package:darrebni_exam/core/utils/network_util.dart';
// import 'package:darrebni_exam/ui/shared/utils.dart';
// import 'package:dartz/dartz.dart';

// class SliderRepository{
//   Future<Either<String, List<QuestionModel>>> getExamByExam({
  
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         type: RequestType.GET,
//         route: 'api/sliders',
//         params: {
//           'college_uuid': '${storege.getCollegeUuid()}',
//           // 'specialty_uuid': '${speciality_uuid}',
//           // 'exam_uuid': '8c0da07e-2ad6-4697-9dfd-d8dc626d75e2',
//           // 'exam_uuid': '${examUuid}',
//           // 'specialty_uuid': '${speciality_uuid}',
//         },
//         headers:
//             NetworkConfig.getHeaders(type: RequestType.GET, needAuth: true),
//       ).then((value) {
//         CommonResponse<List<dynamic>> commonResponse =
//             CommonResponse.fromJson(value);

//         if (commonResponse.getStatus) {
//           List<QuestionModel> result = [];
//           print(result.length);
//           commonResponse.data!.forEach(
//             (element) {
//               result.add(QuestionModel.fromJson(element));
//             },
//           );

//           return Right(result);
//         } else {
//           return Left(commonResponse.message);
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }


// }