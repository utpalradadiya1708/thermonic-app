import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/common_response/common_response.dart';
import '../../../../models/common_response/failure_response.dart';
import '../../../services/api_service/configs.dart';
import '../../../services/api_service/dio_client.dart';
import '../../enum/method_type.dart';

abstract class AppVideoRepository {
  Future<Either<FailureResponse, CommonResponse>> videoWatched(
    Map<String, dynamic> params,
  );
}

@Injectable(as: AppVideoRepository)
class CommonRepositoryImpl extends AppVideoRepository {
  final DioClient dioClient;

  CommonRepositoryImpl({required this.dioClient});

  @override
  Future<Either<FailureResponse, CommonResponse>> videoWatched(
    Map<String, dynamic> params,
  ) async {
    try {
      return await dioClient.request(
        ApiConstant.videoWatched,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }
}
