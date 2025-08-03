import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/common_response/common_response.dart';
import '../../../../models/common_response/failure_response.dart';
import '../../../services/api_service/configs.dart';
import '../../../services/api_service/dio_client.dart';
import '../../enum/method_type.dart';

abstract class OrderRepository {
  Future<Either<FailureResponse, CommonResponse>> createOrder(
    Map<String, dynamic> params,
  );

  Future<Either<FailureResponse, CommonResponse>> getOrderList({
    String? type,
    Map<String, dynamic>? params,
  });

  Future<Either<FailureResponse, CommonResponse>> getPromoCodeList({
    Map<String, dynamic>? params,
  });
}

@Injectable(as: OrderRepository)
class CommonRepositoryImpl extends OrderRepository {
  final DioClient dioClient;

  CommonRepositoryImpl({required this.dioClient});

  @override
  Future<Either<FailureResponse, CommonResponse>> createOrder(
    Map<String, dynamic> params,
  ) async {
    try {
      return await dioClient.request(
        ApiConstant.order,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> getOrderList({
    String? type,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dioClient.request(
        '${ApiConstant.orderList}/$type',
        MethodType.get,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> getPromoCodeList({
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dioClient.request(
        ApiConstant.promocodes,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }
}
