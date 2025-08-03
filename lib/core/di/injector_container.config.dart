// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:thermonic/core/common/repository/apis/app_video_repository.dart'
    as _i984;
import 'package:thermonic/core/common/repository/apis/auth_repository.dart'
    as _i758;
import 'package:thermonic/core/common/repository/apis/chapter_repository.dart'
    as _i764;
import 'package:thermonic/core/common/repository/apis/chat_repository.dart'
    as _i516;
import 'package:thermonic/core/common/repository/apis/common_repository.dart'
    as _i983;
import 'package:thermonic/core/common/repository/apis/exam_repository.dart'
    as _i81;
import 'package:thermonic/core/common/repository/apis/home_repository.dart'
    as _i615;
import 'package:thermonic/core/common/repository/apis/order_repository.dart'
    as _i42;
import 'package:thermonic/core/common/repository/apis/review_repository.dart'
    as _i1;
import 'package:thermonic/core/common/repository/apis/subject_repository.dart'
    as _i828;
import 'package:thermonic/core/common/repository/local_data/local_data_source.dart'
    as _i315;
import 'package:thermonic/core/common/repository/local_data/local_data_source_impl.dart'
    as _i591;
import 'package:thermonic/core/services/api_service/dio_client.dart' as _i170;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.factory<_i170.DioClient>(() => _i170.DioClient());
  gh.lazySingleton<_i315.LocalDataSource>(() => _i591.LocalDataSourceImpl());
  gh.factory<_i615.HomeRepository>(
    () => _i615.HomeRepositoryImpl(dioClient: gh<_i170.DioClient>()),
  );
  gh.factory<_i81.ExamRepository>(
    () => _i81.HomeRepositoryImpl(dioClient: gh<_i170.DioClient>()),
  );
  gh.factory<_i516.ChatRepository>(
    () => _i516.CommonRepositoryImpl(dioClient: gh<_i170.DioClient>()),
  );
  gh.factory<_i42.OrderRepository>(
    () => _i42.CommonRepositoryImpl(dioClient: gh<_i170.DioClient>()),
  );
  gh.factory<_i828.SubjectRepository>(
    () => _i828.HomeRepositoryImpl(dioClient: gh<_i170.DioClient>()),
  );
  gh.factory<_i1.ReviewRepository>(
    () => _i1.CommonRepositoryImpl(dioClient: gh<_i170.DioClient>()),
  );
  gh.factory<_i764.ChapterRepository>(
    () => _i764.HomeRepositoryImpl(dioClient: gh<_i170.DioClient>()),
  );
  gh.factory<_i983.CommonRepository>(
    () => _i983.CommonRepositoryImpl(dioClient: gh<_i170.DioClient>()),
  );
  gh.factory<_i984.AppVideoRepository>(
    () => _i984.CommonRepositoryImpl(dioClient: gh<_i170.DioClient>()),
  );
  gh.factory<_i758.AuthRepository>(
    () => _i758.AuthRepositoryImpl(dioClient: gh<_i170.DioClient>()),
  );
  return getIt;
}
