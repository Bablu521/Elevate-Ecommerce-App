// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/client/api_client.dart' as _i508;
import '../../api/client/api_module.dart' as _i272;
import '../../api/data_source/auth_local_data_source_impl.dart' as _i914;
import '../../api/data_source/auth_remote_data_source_impl.dart' as _i222;
import '../../api/data_source/cart_remote_data_source_impl.dart' as _i279;
import '../../data/data_source/auth_local_data_source.dart' as _i891;
import '../../data/data_source/auth_remote_data_source.dart' as _i697;
import '../../data/data_source/cart_remote_data_source.dart' as _i986;
import '../../data/repositories/auth_repo_impl.dart' as _i653;
import '../../data/repositories/cart_repo_impl.dart' as _i418;
import '../../domin/repositories/auth_repo.dart' as _i340;
import '../../domin/repositories/cart_repo.dart' as _i547;
import '../../domin/use_cases/add_product_to_cart_use_case.dart' as _i449;
import '../../domin/use_cases/clear_user_cart_use_case.dart' as _i950;
import '../../domin/use_cases/delete_specific_cart_item_use_case.dart' as _i721;
import '../../domin/use_cases/get_logged_user_cart_use_case.dart' as _i193;
import '../../domin/use_cases/get_user_status_use_case.dart' as _i799;
import '../../domin/use_cases/guest_login_use_case.dart' as _i917;
import '../../domin/use_cases/login_use_case.dart' as _i1073;
import '../../domin/use_cases/register_use_case.dart' as _i638;
import '../../presentation/auth/login/view_models/login_cubit.dart' as _i441;
import '../../presentation/auth/register/view_models/register_view_model.dart'
    as _i490;
import '../../presentation/cart/view_models/cart_view_model.dart' as _i1031;
import '../module/secure_storage_module.dart' as _i260;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    final secureStorageModule = _$SecureStorageModule();
    gh.singleton<_i361.Dio>(() => apiModule.provideDio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.secureStorage,
    );
    gh.factory<_i508.ApiClient>(() => _i508.ApiClient.new(gh<_i361.Dio>()));
    gh.factory<_i891.AuthLocalDataSource>(
      () => _i914.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i697.AuthRemoteDataSource>(
      () => _i222.AuthRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i340.AuthRepo>(
      () => _i653.AuthRepoImpl(
        gh<_i697.AuthRemoteDataSource>(),
        gh<_i891.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i799.GetUserStatusUseCase>(
      () => _i799.GetUserStatusUseCase(gh<_i340.AuthRepo>()),
    );
    gh.lazySingleton<_i917.GuestLoginUseCase>(
      () => _i917.GuestLoginUseCase(gh<_i340.AuthRepo>()),
    );
    gh.lazySingleton<_i1073.LoginUseCase>(
      () => _i1073.LoginUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i638.RegisterUseCase>(
      () => _i638.RegisterUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i441.LoginCubit>(
      () => _i441.LoginCubit(
        gh<_i1073.LoginUseCase>(),
        gh<_i917.GuestLoginUseCase>(),
      ),
    );
    gh.factory<_i986.CartRemoteDataSource>(
      () => _i279.CartRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i490.RegisterViewModel>(
      () => _i490.RegisterViewModel(gh<_i638.RegisterUseCase>()),
    );
    gh.factory<_i547.CartRepo>(
      () => _i418.CartRepoImpl(gh<_i986.CartRemoteDataSource>()),
    );
    gh.factory<_i449.AddProductToCartUseCase>(
      () => _i449.AddProductToCartUseCase(gh<_i547.CartRepo>()),
    );
    gh.factory<_i950.ClearUserCartUseCase>(
      () => _i950.ClearUserCartUseCase(gh<_i547.CartRepo>()),
    );
    gh.factory<_i721.DeleteSpecificCartItemUseCase>(
      () => _i721.DeleteSpecificCartItemUseCase(gh<_i547.CartRepo>()),
    );
    gh.factory<_i193.GetLoggedUserCartUseCase>(
      () => _i193.GetLoggedUserCartUseCase(gh<_i547.CartRepo>()),
    );
    gh.factory<_i1031.CartViewModel>(
      () => _i1031.CartViewModel(
        gh<_i193.GetLoggedUserCartUseCase>(),
        gh<_i449.AddProductToCartUseCase>(),
        gh<_i721.DeleteSpecificCartItemUseCase>(),
        gh<_i950.ClearUserCartUseCase>(),
        gh<_i799.GetUserStatusUseCase>(),
      ),
    );
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}

class _$SecureStorageModule extends _i260.SecureStorageModule {}
