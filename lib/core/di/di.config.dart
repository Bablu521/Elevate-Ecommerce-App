// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/client/api_client.dart' as _i508;
import '../../api/client/api_module.dart' as _i272;
import '../../api/data_source/occasion_remote_data_source_impl.dart' as _i854;
import '../../data/data_source/occasion_remote_data_source.dart' as _i802;
import '../../data/repositories/occasion_repo_impl.dart' as _i847;
import '../../domin/repositories/occasion_repo.dart' as _i657;
import '../../domin/use_cases/occasion_use_case.dart' as _i1046;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    gh.singleton<_i361.Dio>(() => apiModule.provideDio());
    gh.factory<_i508.ApiClient>(() => _i508.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i802.OccasionRemoteDataSource>(
      () => _i854.OccasionRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i657.OccasionRepo>(
      () => _i847.OccasionRepoImpl(gh<_i802.OccasionRemoteDataSource>()),
    );
    gh.factory<_i1046.OccasionUseCase>(
      () => _i1046.OccasionUseCase(gh<_i657.OccasionRepo>()),
    );
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}
