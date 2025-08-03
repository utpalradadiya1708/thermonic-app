import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/common_response/common_response.dart';
import '../../../../models/common_response/failure_response.dart';
import '../../../services/api_service/configs.dart';
import '../../../services/api_service/dio_client.dart';
import '../../enum/method_type.dart';

abstract class AuthRepository {
  Future<Either<FailureResponse, CommonResponse>> init(
    String platform,
    String version, {
    String? userId,
  });

  Future<Either<FailureResponse, CommonResponse>> doSendOtp(
    Map<String, String> params,
  );

  Future<Either<FailureResponse, CommonResponse>> doLogin(
    Map<String, String> params,
  );

  Future<Either<FailureResponse, CommonResponse>> doProfileSetup(Object params);

  Future<Either<FailureResponse, CommonResponse>> doLogout();

  Future<Either<FailureResponse, CommonResponse>> doDeleteAccount();

  Future<Either<FailureResponse, CommonResponse>> updateLanguage(
    String languageCode,
  );
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final DioClient dioClient;

  AuthRepositoryImpl({required this.dioClient});

  @override
  Future<Either<FailureResponse, CommonResponse>> init(
    String platform,
    String version, {
    String? userId,
  }) async {
    try {
      String url = '${ApiConstant.init}/customer_$platform/$version';

      if (userId != null && userId.isNotEmpty) {
        url += '?user_id=$userId';
      }
      return await dioClient.request(
        url,
        //customer/init/customer_android/0.0.1
        MethodType.get,
        null,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> doSendOtp(
    Map<String, String> params,
  ) async {
    try {
      return await dioClient.request(
        ApiConstant.sendOtp,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> doLogin(
    Map<String, String> params,
  ) async {
    try {
      return await dioClient.request(
        ApiConstant.login,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> doProfileSetup(
    Object params,
  ) async {
    try {
      return await dioClient.multipartRequest(
        ApiConstant.profileSetup,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> doLogout() async {
    try {
      return await dioClient.request(ApiConstant.logout, MethodType.get, null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> doDeleteAccount() async {
    try {
      return await dioClient.request(
        ApiConstant.deleteAccount,
        MethodType.delete,
        null,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> updateLanguage(
    String languageCode,
  ) async {
    try {
      return await dioClient.request(
        '${ApiConstant.updateLanguage}/$languageCode',
        MethodType.get,
        null,
      );
    } catch (e) {
      rethrow;
    }
  }
}
