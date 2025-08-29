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
import '../../api/data_source/categories_remote_data_source_impl.dart' as _i451;
import '../../api/data_source/home/home_data_source_impl.dart' as _i497;
import '../../api/data_source/occasion_remote_data_source_impl.dart' as _i854;
import '../../api/data_source/product_remote_data_source_impl.dart' as _i5;
import '../../api/data_source/products_remote_data_source_impl.dart' as _i950;
import '../../data/data_source/auth_local_data_source.dart' as _i891;
import '../../data/data_source/auth_remote_data_source.dart' as _i697;
import '../../data/data_source/categories_remote_data_source.dart' as _i84;
import '../../data/data_source/home/home_data_source.dart' as _i494;
import '../../data/data_source/occasion_remote_data_source.dart' as _i802;
import '../../data/data_source/product_remote_data_source.dart' as _i357;
import '../../data/data_source/products_remote_data_source.dart' as _i1000;
import '../../data/repositories/auth_repo_impl.dart' as _i653;
import '../../data/repositories/categories_repo_impl.dart' as _i1008;
import '../../data/repositories/home/home_repo_impl.dart' as _i1069;
import '../../data/repositories/occasion_repo_impl.dart' as _i847;
import '../../data/repositories/product_repo_impl.dart' as _i953;
import '../../data/repositories/products_repo_impl.dart' as _i177;
import '../../domin/repositories/auth_repo.dart' as _i340;
import '../../domin/repositories/categories_repo.dart' as _i983;
import '../../domin/repositories/home/home_repo.dart' as _i733;
import '../../domin/repositories/occasion_repo.dart' as _i657;
import '../../domin/repositories/product_repo.dart' as _i591;
import '../../domin/repositories/products_repo.dart' as _i679;
import '../../domin/use_case/get_all_categories_use_case.dart' as _i520;
import '../../domin/use_case/get_all_products_use_case.dart' as _i966;
import '../../domin/use_case/get_products_by_category_use_case.dart' as _i1032;
import '../../domin/use_case/get_products_by_occasion_use_case.dart' as _i150;
import '../../domin/use_cases/forget_password_use_case.dart' as _i213;
import '../../domin/use_cases/get_products_by_category_use_case.dart' as _i688;
import '../../domin/use_cases/get_products_by_occasion_use_case.dart' as _i176;
import '../../domin/use_cases/guest_login_use_case.dart' as _i917;
import '../../domin/use_cases/home/get_home_use_case.dart' as _i740;
import '../../domin/use_cases/login_use_case.dart' as _i1073;
import '../../domin/use_cases/occasion_use_case.dart' as _i1046;
import '../../domin/use_cases/register_use_case.dart' as _i638;
import '../../domin/use_cases/reset_password_use_case.dart' as _i670;
import '../../domin/use_cases/verify_reset_code_use_case.dart' as _i643;
import '../../presentation/auth/forget_password/view_models/forget_password_view_model.dart'
    as _i132;
import '../../presentation/auth/login/view_models/login_cubit.dart' as _i441;
import '../../presentation/auth/register/view_models/register_view_model.dart'
    as _i490;
import '../../presentation/categories/view_models/categories_view_model.dart'
    as _i350;
import '../../presentation/home/view_models/home_view_model.dart' as _i479;
import '../../presentation/occasion/view_models/occasion_view_model.dart'
    as _i979;
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
    gh.factory<_i697.AuthRemoteDataSource>(
      () => _i222.AuthRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i891.AuthLocalDataSource>(
      () => _i914.AuthLocalDataSourceImpl(
        secureStorage: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i1000.ProductsRemoteDataSource>(
      () => _i950.ProductsRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i494.HomeRemoteDataSource>(
      () => _i497.HomeRemoteDataSourceImpl(apiClient: gh<_i508.ApiClient>()),
    );
    gh.factory<_i802.OccasionRemoteDataSource>(
      () => _i854.OccasionRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i84.CategoriesRemoteDataSource>(
      () => _i451.CategoriesRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i357.ProductRemoteDataSource>(
      () => _i5.ProductRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i679.ProductsRepo>(
      () => _i177.ProductsRepoImpl(gh<_i1000.ProductsRemoteDataSource>()),
    );
    gh.factory<_i966.GetAllProductsUseCase>(
      () => _i966.GetAllProductsUseCase(gh<_i679.ProductsRepo>()),
    );
    gh.factory<_i1032.GetProductsByCategoryUseCase>(
      () => _i1032.GetProductsByCategoryUseCase(gh<_i679.ProductsRepo>()),
    );
    gh.factory<_i150.GetProductsByOccasionUseCase>(
      () => _i150.GetProductsByOccasionUseCase(gh<_i679.ProductsRepo>()),
    );
    gh.factory<_i983.CategoriesRepo>(
      () => _i1008.CategoriesRepoImpl(gh<_i84.CategoriesRemoteDataSource>()),
    );
    gh.factory<_i733.HomeRepo>(
      () => _i1069.HomeRepoImpl(
        homeRemoteDataSource: gh<_i494.HomeRemoteDataSource>(),
      ),
    );
    gh.factory<_i340.AuthRepo>(
      () => _i653.AuthRepoImpl(
        gh<_i697.AuthRemoteDataSource>(),
        gh<_i891.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i917.GuestLoginUseCase>(
      () => _i917.GuestLoginUseCase(gh<_i340.AuthRepo>()),
    );
    gh.lazySingleton<_i1073.LoginUseCase>(
      () => _i1073.LoginUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i213.ForgetPasswordUseCase>(
      () => _i213.ForgetPasswordUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i638.RegisterUseCase>(
      () => _i638.RegisterUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i670.ResetPasswordUseCase>(
      () => _i670.ResetPasswordUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i643.VerifyResetCodeUseCase>(
      () => _i643.VerifyResetCodeUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i441.LoginCubit>(
      () => _i441.LoginCubit(
        gh<_i1073.LoginUseCase>(),
        gh<_i917.GuestLoginUseCase>(),
      ),
    );
    gh.factory<_i591.ProductRepo>(
      () => _i953.ProductRepoImpl(gh<_i357.ProductRemoteDataSource>()),
    );
    gh.factory<_i657.OccasionRepo>(
      () => _i847.OccasionRepoImpl(gh<_i802.OccasionRemoteDataSource>()),
    );
    gh.factory<_i490.RegisterViewModel>(
      () => _i490.RegisterViewModel(gh<_i638.RegisterUseCase>()),
    );
    gh.factory<_i132.ForgetPasswordViewModel>(
      () => _i132.ForgetPasswordViewModel(
        gh<_i213.ForgetPasswordUseCase>(),
        gh<_i643.VerifyResetCodeUseCase>(),
        gh<_i670.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i520.GetAllCategoriesUseCase>(
      () => _i520.GetAllCategoriesUseCase(gh<_i983.CategoriesRepo>()),
    );
    gh.factory<_i740.GetHomeUseCase>(
      () => _i740.GetHomeUseCase(homeRepo: gh<_i733.HomeRepo>()),
    );
    gh.factory<_i688.GetProductsByCategoryUseCase>(
      () => _i688.GetProductsByCategoryUseCase(gh<_i591.ProductRepo>()),
    );
    gh.factory<_i176.GetProductsByOccasionUseCase>(
      () => _i176.GetProductsByOccasionUseCase(gh<_i591.ProductRepo>()),
    );
    gh.factory<_i350.CategoriesViewModel>(
      () => _i350.CategoriesViewModel(
        gh<_i520.GetAllCategoriesUseCase>(),
        gh<_i1032.GetProductsByCategoryUseCase>(),
        gh<_i966.GetAllProductsUseCase>(),
      ),
    );
    gh.factory<_i1046.OccasionUseCase>(
      () => _i1046.OccasionUseCase(gh<_i657.OccasionRepo>()),
    );
    gh.factory<_i479.HomeViewModel>(
      () => _i479.HomeViewModel(gh<_i740.GetHomeUseCase>()),
    );
    gh.factory<_i979.OccasionViewModel>(
      () => _i979.OccasionViewModel(
        gh<_i1046.OccasionUseCase>(),
        gh<_i176.GetProductsByOccasionUseCase>(),
      ),
    );
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}

class _$SecureStorageModule extends _i260.SecureStorageModule {}
