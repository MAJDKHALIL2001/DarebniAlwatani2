import 'package:darrebni_exam/core/data/network/moduls/college_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/common_response.dart';
import 'package:darrebni_exam/core/data/network/moduls/import_question_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/notification_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/question_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/token_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/user_model.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:dartz/dartz.dart';

import 'package:darrebni_exam/core/data/network/network_config.dart';
import 'package:darrebni_exam/core/enums/request_type.dart';
import 'package:darrebni_exam/core/utils/network_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository {
  Future<Either<String, String>> sinUp({
    required String name,
    required String phone,
    required String college_uuid,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/user/register',
        headers:
            NetworkConfig.getHeaders(type: RequestType.POST, needAuth: false),
        body: {
          "name": name,
          "phone": phone,
          "college_uuid": college_uuid,
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right('تم انشاء حساب بنجاح');
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, TokenModel>> logIn({
    required String name,
    required String code,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/user/login',
        headers:
            NetworkConfig.getHeaders(type: RequestType.POST, needAuth: false),
        body: {
          "name": name,
          "code": code,
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          storege.setCollegeUuid(commonResponse.college_uuid);
          print(storege.getCollegeUuid());
          return Right(TokenModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> logOut() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/user/logout',
        headers:
            NetworkConfig.getHeaders(type: RequestType.POST, needAuth: true),
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right('تم تسجيل الخروج بنجاح');
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> updateFcmToken({
    required String fcmToken,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          route: 'user/updateFcmToken',
          body: {
            "token": fcmToken,
          },
          headers: NetworkConfig.getHeaders(
            type: RequestType.POST,
          )).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  //////////////////////////////////////////////////////////////////
  Future<Either<String, List<importQuestionModel>>> getImportQuestion() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/user/favorite',
        params: {'college_uuid': '${storege.getCollegeUuid()}'},
        headers:
            NetworkConfig.getHeaders(type: RequestType.GET, needAuth: true),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          List<importQuestionModel> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(importQuestionModel.fromJson(element));
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

  Future<Either<String, userModel>> getUserInfo() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          route: 'api/user/profile',
          params: {'college_uuid': '${storege.getCollegeUuid()}'},
          headers: NetworkConfig.getHeaders(
            type: RequestType.GET,
            needAuth: true,
          )).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(userModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<QuestionModel>>> showImortantQuestion(
      {required String queUuid}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/user/show-favorite',
        params: {
          'college_uuid': '${storege.getCollegeUuid()}',
          'uuid': '${queUuid}',
        },
        headers:
            NetworkConfig.getHeaders(type: RequestType.GET, needAuth: true),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          List<QuestionModel> result = [];

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

  Future<Either<String, String>> editUserDetails({
    required String name,
    required String phone,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/user/profile/update',
        headers:
            NetworkConfig.getHeaders(type: RequestType.POST, needAuth: true),
        body: {
          "name": name,
          "phone": phone,
        },
        params: {
          'college_uuid': '${storege.getCollegeUuid()}',
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right('تم تعديل  المعلومات بنجاح');
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<NotifictionModel>>> getNotification() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.GET,
          route: 'api/user/notifications',
          params: {'college_uuid': '${storege.getCollegeUuid()}'},
          headers: NetworkConfig.getHeaders(
            type: RequestType.GET,
            needAuth: true,
          )).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          List<NotifictionModel> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(NotifictionModel.fromJson(element));
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

  Future<Either<String, String>> addSuggestion({
    required String text,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/user/suggestion',
        headers:
            NetworkConfig.getHeaders(type: RequestType.POST, needAuth: true),
        body: {'text': text},
        params: {
          'college_uuid': '${storege.getCollegeUuid()}',
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right('تم ارسال تعليقك بنجاح');
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
