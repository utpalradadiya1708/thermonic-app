import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/common_response/common_response.dart';
import '../../../../models/common_response/failure_response.dart';
import '../../../services/api_service/configs.dart';
import '../../../services/api_service/dio_client.dart';
import '../../enum/method_type.dart';

abstract class ExamRepository {
  Future<Either<FailureResponse, CommonResponse>> getExams({Map<String, dynamic> params});

  Future<Either<FailureResponse, CommonResponse>> getQuestionList({Map<String, dynamic> params});

  Future<Either<FailureResponse, CommonResponse>> saveAnswer({Map<String, dynamic> params});

  Future<Either<FailureResponse, CommonResponse>> examHistory({Map<String, dynamic> params});

  Future<Either<FailureResponse, CommonResponse>> quitExam({Map<String, dynamic> params});
}

@Injectable(as: ExamRepository)
class HomeRepositoryImpl extends ExamRepository {
  final DioClient dioClient;

  HomeRepositoryImpl({required this.dioClient});

  @override
  Future<Either<FailureResponse, CommonResponse>> getExams({Map<String, dynamic>? params}) async {
    try {
      return await dioClient.request(ApiConstant.exams, MethodType.post, params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> getQuestionList({Map<String, dynamic>? params}) async {
    try {
      return await dioClient.request(ApiConstant.questions, MethodType.post, params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> saveAnswer({Map<String, dynamic>? params}) async {
    try {
      return await dioClient.request(ApiConstant.saveAnswer, MethodType.post, params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> examHistory({Map<String, dynamic>? params}) async {
    try {
      return await dioClient.request(ApiConstant.examHistory, MethodType.post, params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> quitExam({Map<String, dynamic>? params}) async {
    try {
      return await dioClient.request(ApiConstant.quitExam, MethodType.post, params);
    } catch (e) {
      rethrow;
    }
  }
}
