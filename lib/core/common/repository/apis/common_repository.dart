import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/common_response/common_response.dart';
import '../../../../models/common_response/failure_response.dart';
import '../../../services/api_service/configs.dart';
import '../../../services/api_service/dio_client.dart';
import '../../enum/method_type.dart';

abstract class CommonRepository {
  Future<Either<FailureResponse, CommonResponse>> getFAQ();

  Future<Either<FailureResponse, CommonResponse>> doContactUs(
    Map<String, String> params,
  );

  Future<Either<FailureResponse, CommonResponse>> getNotificationList(
    Map<String, dynamic> params,
  );

  Future<Either<FailureResponse, CommonResponse>> clearNotifications();

  Future<Either<FailureResponse, CommonResponse>> getCommonSearchList(
    Map<String, dynamic> params,
  );
}

@Injectable(as: CommonRepository)
class CommonRepositoryImpl extends CommonRepository {
  final DioClient dioClient;

  CommonRepositoryImpl({required this.dioClient});

  @override
  Future<Either<FailureResponse, CommonResponse>> getFAQ() async {
    try {
      return await dioClient.request(ApiConstant.faq, MethodType.get, null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> getCommonSearchList(
    Map<String, dynamic> params,
  ) async {
    try {
      return await dioClient.request(
        ApiConstant.search,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> getNotificationList(
    Map<String, dynamic> params,
  ) async {
    try {
      return await dioClient.request(
        ApiConstant.notificationList,
        MethodType.get,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> clearNotifications() async {
    try {
      return await dioClient.request(
        ApiConstant.clearNotifications,
        MethodType.get,
        null,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> doContactUs(
    Map<String, String> params,
  ) async {
    try {
      return await dioClient.request(
        ApiConstant.contactUs,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }
}
