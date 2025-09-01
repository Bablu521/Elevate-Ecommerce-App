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
import '../../api/data_source/cart_remote_data_source_impl.dart' as _i279;
import '../../data/data_source/cart_remote_data_source.dart' as _i986;
import '../../data/repositories/cart_repo_impl.dart' as _i418;
import '../../domin/repositories/cart_repo.dart' as _i547;
import '../../domin/use_cases/add_product_to_cart_use_case.dart' as _i449;
import '../../domin/use_cases/clear_user_cart_use_case.dart' as _i950;
import '../../domin/use_cases/delete_specific_cart_item_use_case.dart' as _i721;
import '../../domin/use_cases/get_logged_user_cart_use_case.dart' as _i193;

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
    gh.factory<_i986.CartRemoteDataSource>(
      () => _i279.CartRemoteDataSourceImpl(gh<_i508.ApiClient>()),
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
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}
