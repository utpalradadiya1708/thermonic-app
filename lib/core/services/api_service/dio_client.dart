import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart' as getPackage;
import 'package:get/route_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:thermonic/core/common/widget/common_components.dart';

import '../../../models/common_response/common_response.dart';
import '../../../models/common_response/failure_response.dart';
import '../../../utils/logger_util.dart';
import '../../../utils/utils.dart';
import '../../common/enum/method_type.dart';
import '../../env/env.dart';
import '../../routes/app_pages.dart';
import 'api_interceptor.dart';

@Injectable()
class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        sendTimeout: Duration(seconds: 60),
      ),
    )..interceptors.add(ApiInterceptors());

    // ✅ Allow self-signed/invalid certs (DEV ONLY)
    /// TODO : REMOVE IN PRODUCTION
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
  }

  Future<Either<FailureResponse, CommonResponse>> request(
    String url,
    MethodType method,
    params,
  ) async {
    try {
      Response response;
      if (await checkConnectivity()) {
        if (method == MethodType.post) {
          response = await _dio.post(url, data: params);
        } else if (method == MethodType.delete) {
          response = await _dio.delete(url);
        } else if (method == MethodType.patch) {
          response = await _dio.patch(url);
        } else if (method == MethodType.put) {
          response = await _dio.put(url, data: params);
        } else {
          if (params != null) {
            response = await _dio.get(url, queryParameters: params);
          } else {
            response = await _dio.get(url);
          }
        }

        return right(CommonResponse.fromJson(response.data, (json) => json));
      } else {
        return left(
          FailureResponse(false, "lblCheckYourConnection".tr),
        ); // todo: change no internet string
      }
    } on DioException catch (dioError) {
      return left(FailureResponse(false, handelDioException(dioError)));
      /*if (dioError.response?.statusCode == 401 || dioError.response?.statusCode == 302) {
        forceLogoutApiCall();
        return left(FailureResponse(false, "Session expired please log in again"));
      } else {
        return left(
          FailureResponse(false, dioError.message ?? ""),
        );
      }*/
    } catch (error) {
      return left(FailureResponse(false, error.toString()));
    }
  }

  Future<Either<FailureResponse, CommonResponse>> multipartRequest(
    String url,
    MethodType method,
    params,
  ) async {
    try {
      Response response;
      if (await checkConnectivity()) {
        response = await _dio.post(
          url,
          data: params,
          options: Options(headers: {"Content-Type": "multipart/form-data"}),
        );
        return right(CommonResponse.fromJson(response.data, (json) => json));
      } else {
        return left(
          FailureResponse(false, "lblCheckYourConnection".tr),
        ); // todo: change no internet string
      }
    } on DioException catch (dioError) {
      return left(FailureResponse(false, handelDioException(dioError)));
      /*handelDioException(dioError);
      if (dioError.response?.statusCode == 401 || dioError.response?.statusCode == 302) {
        forceLogoutApiCall();
        return left(FailureResponse(false, "Session expired please log in again"));
      } else {
        return left(
          FailureResponse(false, dioError.message ?? ""),
        );
      }*/
    } catch (error) {
      return left(FailureResponse(false, error.toString()));
    }
  }

  void forceLogoutApiCall({String? message}) {
    clearData();
    Get.offAllNamed(Routes.login);
    if (message != null && message.isNotEmpty) {
      CommonComponents.displaySnackBarError("Session Expired!");
    }
  }

  String handelDioException(DioException dioError) {
    MyLogger.e("${dioError.error}");
    MyLogger.e("${dioError.response}");
    MyLogger.e("${dioError.type}");

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout';

      case DioExceptionType.connectionError:
        return 'lblCheckYourConnection'.tr;

      case DioExceptionType.badResponse:
        switch (dioError.response?.statusCode) {
          case 401:
          case 302:
            final msg = dioError.response?.data['message'] ?? '';
            final isAutoLogout = msg.toLowerCase().contains('unauthenticated');

            forceLogoutApiCall(
              message: isAutoLogout
                  ? "lblAutoLogout".tr
                  : "lblSessionExpired".tr,
            );

            return '';

          case 400:
          case 403:
          case 404:
          case 500:
            return dioError.response?.data['message'];
          default:
            return 'lblSomethingWentWrong'.tr;
        }
      /*default:
        return 'lblSomethingWentWrong'.tr;*/
      case DioExceptionType.badCertificate:
        return 'lblCheckYourConnection'.tr;
      case DioExceptionType.cancel:
        return 'lblSomethingWentWrong'.tr;
      case DioExceptionType.unknown:
        return 'lblSomethingWentWrong'.tr;
    }
  }
}

void forceLogoutApiCall({String? message}) {
  clearData();
  Get.offAllNamed(Routes.login);
  if (message != null && message.isNotEmpty) {
    CommonComponents.displaySnackBarError(
      message,
    ); // or use your existing snackbar method
  }
}
