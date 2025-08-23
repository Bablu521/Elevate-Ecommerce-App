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
import '../../api/data_source/auth_remote_data_source_impl.dart' as _i222;
import '../../data/data_source/auth_remote_data_source.dart' as _i697;
import '../../data/repositories/auth_repo_impl.dart' as _i653;
import '../../domin/repositories/auth_repo.dart' as _i340;
import '../../domin/use_cases/forget_password_use_case.dart' as _i213;
import '../../domin/use_cases/reset_password_use_case.dart' as _i670;
import '../../domin/use_cases/verify_reset_code_use_case.dart' as _i643;
import '../../presentation/auth/forget_password/view_models/forget_password_view_model.dart'
    as _i132;

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
    gh.factory<_i697.AuthRemoteDataSource>(
      () => _i222.AuthRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i340.AuthRepo>(
      () => _i653.AuthRepoImpl(gh<_i697.AuthRemoteDataSource>()),
    );
    gh.factory<_i213.ForgetPasswordUseCase>(
      () => _i213.ForgetPasswordUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i670.ResetPasswordUseCase>(
      () => _i670.ResetPasswordUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i643.VerifyResetCodeUseCase>(
      () => _i643.VerifyResetCodeUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i132.ForgetPasswordViewModel>(
      () => _i132.ForgetPasswordViewModel(
        gh<_i213.ForgetPasswordUseCase>(),
        gh<_i643.VerifyResetCodeUseCase>(),
        gh<_i670.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}
