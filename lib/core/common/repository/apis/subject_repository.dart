import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/common_response/common_response.dart';
import '../../../../models/common_response/failure_response.dart';
import '../../../services/api_service/configs.dart';
import '../../../services/api_service/dio_client.dart';
import '../../enum/method_type.dart';

abstract class SubjectRepository {
  Future<Either<FailureResponse, CommonResponse>> getSubjects({
    Map<String, dynamic>? params,
  });

  Future<Either<FailureResponse, CommonResponse>> getSubjectDetails({
    Map<String, dynamic>? params,
  });

  Future<Either<FailureResponse, CommonResponse>> getExamDetails({
    Map<String, dynamic>? params,
  });
}

@Injectable(as: SubjectRepository)
class HomeRepositoryImpl extends SubjectRepository {
  final DioClient dioClient;

  HomeRepositoryImpl({required this.dioClient});

  @override
  Future<Either<FailureResponse, CommonResponse>> getSubjects({
    int? id,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dioClient.request(
        ApiConstant.subjects,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> getSubjectDetails({
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dioClient.request(
        ApiConstant.subjectDetails,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> getExamDetails({
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dioClient.request(
        ApiConstant.examDetails,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }
}
