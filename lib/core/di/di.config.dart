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
import '../../api/data_source/profile/edit_profile_data_source_impl.dart'
    as _i966;
import '../../data/data_source/profile/edit_profile_remote_data_source.dart'
    as _i1001;
import '../../data/repositories/profile/edit_profile_impl.dart' as _i177;
import '../../domin/repositories/profile/edit_profile_repo.dart' as _i251;
import '../../domin/use_case/edit_profile_use_case.dart' as _i274;
import '../../presentation/profile/view_model/profile_view_model.dart' as _i671;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    gh.singleton<_i361.Dio>(() => apiModule.provideDio());
    gh.factory<_i508.ApiClient>(() => _i508.ApiClient.new(gh<_i361.Dio>()));
    gh.factory<_i1001.EditProfileRemoteDataSource>(
      () => _i966.EditProfileRemoteDataSourceImpl(
        apiClient: gh<_i508.ApiClient>(),
      ),
    );
    gh.factory<_i251.EditProfileRepo>(
      () => _i177.EditProfileRepoImpl(
        editProfileRemoteDataSource: gh<_i1001.EditProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i274.EditProfileUseCase>(
      () => _i274.EditProfileUseCase(
        editProfileRepo: gh<_i251.EditProfileRepo>(),
      ),
    );
    gh.factory<_i671.ProfileViewModel>(
      () => _i671.ProfileViewModel(gh<_i274.EditProfileUseCase>()),
    );
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}
