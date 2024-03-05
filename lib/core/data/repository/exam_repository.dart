import 'package:darrebni_exam/core/data/network/moduls/common_response.dart';
import 'package:darrebni_exam/core/data/network/moduls/exam_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/question_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/subject_model.dart';
import 'package:darrebni_exam/core/data/network/network_config.dart';
import 'package:darrebni_exam/core/enums/request_type.dart';
import 'package:darrebni_exam/core/utils/network_util.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ExamRepository {
  Future<Either<String, List<QuestionModel>>> getQuestoinByBook({
    required String speciality_uuid,
    required String questionKind,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/user/exams/${questionKind}',
        params: {
          'college_uuid': '${storege.getCollegeUuid()}',
          'specialty_uuid': '${speciality_uuid}',
          // 'specialty_uuid': 'e9d9a3b4-7448-4dad-a915-8443e131ff96',
        },
        headers:
            NetworkConfig.getHeaders(type: RequestType.GET, needAuth: true),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<QuestionModel> result = [];
          print(result.length);
          commonResponse.data!.forEach(
            (element) {
              result.add(QuestionModel.fromJson(element));
            },
          );

          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ExamModel>>> getExamCouses({
    required String speciality_uuid,
    required String degree,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/user/exams/show',
        params: {
          'college_uuid': '${storege.getCollegeUuid()}',
          // 'specialty_uuid': '${speciality_uuid}',
          'specialty_uuid': '${speciality_uuid}',
          'degree': '${degree}',
          // 'specialty_uuid': 'e9d9a3b4-7448-4dad-a915-8443e131ff96',
        },
        headers:
            NetworkConfig.getHeaders(type: RequestType.GET, needAuth: true),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<ExamModel> result = [];
          print(result.length);
          commonResponse.data!.forEach(
            (element) {
              result.add(ExamModel.fromJson(element));
            },
          );

          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<QuestionModel>>> getExamByExam({
    required String speciality_uuid,
    required String examUuid,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/user/exams/exam',
        params: {
          'college_uuid': '${storege.getCollegeUuid()}',
          // 'specialty_uuid': '${speciality_uuid}',
          // 'exam_uuid': '8c0da07e-2ad6-4697-9dfd-d8dc626d75e2',
          'exam_uuid': '${examUuid}',
          'specialty_uuid': '${speciality_uuid}',
        },
        headers:
            NetworkConfig.getHeaders(type: RequestType.GET, needAuth: true),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<QuestionModel> result = [];
          print(result.length);
          commonResponse.data!.forEach(
            (element) {
              result.add(QuestionModel.fromJson(element));
            },
          );

          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<QuestionModel>>> getExamBySubj({
    required String subjUuid,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/user/exams/subject',
        params: {
          'college_uuid': '${storege.getCollegeUuid()}',
          // 'specialty_uuid': '${speciality_uuid}',
          // 'exam_uuid': '8c0da07e-2ad6-4697-9dfd-d8dc626d75e2',
          'subject_uuid': '${subjUuid}',
        },
        headers:
            NetworkConfig.getHeaders(type: RequestType.GET, needAuth: true),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<QuestionModel> result = [];
          print(result.length);
          commonResponse.data!.forEach(
            (element) {
              result.add(QuestionModel.fromJson(element));
            },
          );

          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
