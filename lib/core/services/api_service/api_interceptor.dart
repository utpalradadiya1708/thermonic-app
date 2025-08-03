import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../main.dart';
import '../../../utils/logger_util.dart';
import '../../common/constants/storage_keys.dart';
import '../../common/repository/local_data/local_data_source.dart';
import '../../di/injector_container.dart';
import 'configs.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final method = options.method;
    final uri = options.uri;
    final data = options.data;

    options.headers[Configs.xAPIKey] = Configs.xAPIKeyValue;

    String? token = await getIt<LocalDataSource>().getData(
      StorageKeys.cKeyToken,
    );
    MyLogger.log(
      "✈️✈️✈️✈️✈️✈️✈️✈️ Authorization---->>>>>>>> $token",
      printFullText: true,
    );
    if (token != null && token.isNotEmpty) {
      options.headers[Configs.authorization] = "Bearer $token";
    }
    options.headers[Configs.acceptKey] = Configs.acceptKeyValue;

    // if (options.path.contains("/login")) {
    // String language = await getIt<LocalDataSource>().getData(StorageKeys.cKeyLanguage) ?? 'en';
    options.headers[Configs.cKeyLanguage] =
        localeController.currentLocale.value;
    // }
    if (method == 'GET') {
      MyLogger.log(
        "✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}",
        printFullText: true,
      );
    } else {
      try {
        MyLogger.log(
          "✈️ REQUEST[$method] => PATH: $uri \n Token:${options.headers} \n DATA: ${jsonEncode(data)}",
          printFullText: true,
        );
      } catch (e) {
        MyLogger.log(
          "✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers} \n DATA: $data",
          printFullText: true,
        );
      }
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    MyLogger.log(
      "✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data",
      printFullText: true,
    );
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    MyLogger.log("⚠️ ERROR => ERROR: ${err.error}", printFullText: true);
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.path;
    var data = "";
    try {
      data = jsonEncode(err.response?.data);
    } catch (e) {
      MyLogger.log(e.toString());
    }
    MyLogger.log(
      "⚠️ ERROR[$statusCode] => PATH: $uri\n ERROR Data: $data",
      printFullText: true,
    );
    super.onError(err, handler);
  }
}
