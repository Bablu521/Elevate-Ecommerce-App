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
import '../../api/data_source/categories_remote_data_source_impl.dart' as _i451;
import '../../api/data_source/products_remote_data_source_impl.dart' as _i950;
import '../../data/data_source/categories_remote_data_source.dart' as _i84;
import '../../data/data_source/products_remote_data_source.dart' as _i1000;
import '../../data/repositories/categories_repo_impl.dart' as _i1008;
import '../../data/repositories/products_repo_impl.dart' as _i177;
import '../../domin/repositories/categories_repo.dart' as _i983;
import '../../domin/repositories/products_repo.dart' as _i679;
import '../../domin/use_case/get_all_categories_use_case.dart' as _i520;
import '../../domin/use_case/get_all_products_use_case.dart' as _i966;
import '../../domin/use_case/get_products_by_category_use_case.dart' as _i1032;
import '../../domin/use_case/get_products_by_occasion_use_case.dart' as _i150;
import '../../presentation/categories/view_models/categories_view_model.dart'
    as _i350;

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
    gh.factory<_i1000.ProductsRemoteDataSource>(
      () => _i950.ProductsRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i84.CategoriesRemoteDataSource>(
      () => _i451.CategoriesRemoteDataSourceImpl(gh<_i508.ApiClient>()),
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
    gh.factory<_i520.GetAllCategoriesUseCase>(
      () => _i520.GetAllCategoriesUseCase(gh<_i983.CategoriesRepo>()),
    );
    gh.factory<_i350.CategoriesViewModel>(
      () => _i350.CategoriesViewModel(
        gh<_i520.GetAllCategoriesUseCase>(),
        gh<_i1032.GetProductsByCategoryUseCase>(),
        gh<_i966.GetAllProductsUseCase>(),
      ),
    );
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}
