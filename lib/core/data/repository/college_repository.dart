import 'package:darrebni_exam/core/data/network/moduls/college_model.dart';
import 'package:darrebni_exam/core/data/network/moduls/common_response.dart';
import 'package:darrebni_exam/core/data/network/moduls/subject_model.dart';
import 'package:darrebni_exam/core/data/network/network_config.dart';
import 'package:darrebni_exam/core/enums/request_type.dart';
import 'package:darrebni_exam/core/utils/network_util.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:dartz/dartz.dart';

class CollegeRepository {
  Future<Either<String, List<CollegeModel>>> getCollegeName() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/colleges',
        headers: NetworkConfig.getHeaders(type: RequestType.GET),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<CollegeModel> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(CollegeModel.fromJson(element));
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

  Future<Either<String, List<SubjectModel>>> getSpecialities() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/college/specialty',
        params: {'college_uuid': '${storege.getCollegeUuid()}'},
        headers:
            NetworkConfig.getHeaders(type: RequestType.GET, needAuth: true),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<SubjectModel> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(SubjectModel.fromJson(element));
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

  Future<Either<String, List<SubjectModel>>> getSubjects({
    required String specialityUuuid,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/college/subject',
        params: {
          'college_uuid': '${storege.getCollegeUuid()}',
          'specialty_uuid': '${specialityUuuid}',
        },
        headers:
            NetworkConfig.getHeaders(type: RequestType.GET, needAuth: true),
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<SubjectModel> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(SubjectModel.fromJson(element));
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
