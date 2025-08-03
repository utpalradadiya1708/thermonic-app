import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/common_response/common_response.dart';
import '../../../../models/common_response/failure_response.dart';
import '../../../services/api_service/configs.dart';
import '../../../services/api_service/dio_client.dart';
import '../../enum/method_type.dart';

abstract class ChapterRepository {
  Future<Either<FailureResponse, CommonResponse>> getChapterDetails({
    Map<String, dynamic> params,
  });
  Future<Either<FailureResponse, CommonResponse>> saveUnSaveChapter(
    Map<String, dynamic> params,
  );
  Future<Either<FailureResponse, CommonResponse>> getSavedChapters({
    Map<String, dynamic> params,
  });
}

@Injectable(as: ChapterRepository)
class HomeRepositoryImpl extends ChapterRepository {
  final DioClient dioClient;

  HomeRepositoryImpl({required this.dioClient});

  @override
  Future<Either<FailureResponse, CommonResponse>> getChapterDetails({
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dioClient.request(
        ApiConstant.chapterDetails,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> saveUnSaveChapter(
    Map<String, dynamic> params,
  ) async {
    try {
      return await dioClient.request(
        ApiConstant.saveChapter,
        MethodType.post,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<FailureResponse, CommonResponse>> getSavedChapters({
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dioClient.request(
        ApiConstant.savedChapters,
        MethodType.get,
        params,
      );
    } catch (e) {
      rethrow;
    }
  }
}
