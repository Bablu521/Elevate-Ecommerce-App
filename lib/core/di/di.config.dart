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
import '../../api/data_source/address_local_data_source_impl.dart' as _i734;
import '../../api/data_source/address_remote_data_source_impl.dart' as _i576;
import '../../api/data_source/auth_local_data_source_impl.dart' as _i914;
import '../../api/data_source/auth_remote_data_source_impl.dart' as _i222;
import '../../api/data_source/best_seller_date_source_impl.dart' as _i480;
import '../../api/data_source/cart_remote_data_source_impl.dart' as _i279;
import '../../api/data_source/categories_remote_data_source_impl.dart' as _i451;
import '../../api/data_source/occasion_remote_data_source_impl.dart' as _i854;
import '../../api/data_source/orders_remote_data_source_impl.dart' as _i898;
import '../../api/data_source/products_remote_data_source_impl.dart' as _i950;
import '../../data/data_source/address_local_data_source.dart' as _i973;
import '../../data/data_source/address_remote_data_source.dart' as _i783;
import '../../data/data_source/auth_local_data_source.dart' as _i891;
import '../../data/data_source/auth_remote_data_source.dart' as _i697;
import '../../data/data_source/best_seller_remote_data_source.dart' as _i702;
import '../../data/data_source/cart_remote_data_source.dart' as _i986;
import '../../data/data_source/categories_remote_data_source.dart' as _i84;
import '../../data/data_source/occasion_remote_data_source.dart' as _i802;
import '../../data/data_source/orders_remote_data_source.dart' as _i107;
import '../../data/data_source/products_remote_data_source.dart' as _i1000;
import '../../data/repositories/address_repo_impl.dart' as _i136;
import '../../data/repositories/auth_repo_impl.dart' as _i653;
import '../../data/repositories/best_seller_repo_impl.dart' as _i663;
import '../../data/repositories/cart_repo_impl.dart' as _i418;
import '../../data/repositories/categories_repo_impl.dart' as _i1008;
import '../../data/repositories/occasion_repo_impl.dart' as _i847;
import '../../data/repositories/orders_repo_impl.dart' as _i688;
import '../../data/repositories/products_repo_impl.dart' as _i177;
import '../../domin/repositories/address_repo.dart' as _i579;
import '../../domin/repositories/auth_repo.dart' as _i340;
import '../../domin/repositories/best_seller_repo.dart' as _i135;
import '../../domin/repositories/cart_repo.dart' as _i547;
import '../../domin/repositories/categories_repo.dart' as _i983;
import '../../domin/repositories/occasion_repo.dart' as _i657;
import '../../domin/repositories/orders_repo.dart' as _i555;
import '../../domin/repositories/products_repo.dart' as _i679;
import '../../domin/use_cases/add_address_use_case.dart' as _i865;
import '../../domin/use_cases/add_product_to_cart_use_case.dart' as _i449;
import '../../domin/use_cases/change_password_profile_use_case.dart' as _i257;
import '../../domin/use_cases/clear_user_cart_use_case.dart' as _i950;
import '../../domin/use_cases/delete_specific_cart_item_use_case.dart' as _i721;
import '../../domin/use_cases/forget_password_use_case.dart' as _i213;
import '../../domin/use_cases/get_all_categories_use_case.dart' as _i81;
import '../../domin/use_cases/get_all_products_use_case.dart' as _i512;
import '../../domin/use_cases/get_best_seller_use_case.dart' as _i706;
import '../../domin/use_cases/get_logged_user_addresses_use_case.dart' as _i705;
import '../../domin/use_cases/get_logged_user_cart_use_case.dart' as _i193;
import '../../domin/use_cases/get_orders_use_case.dart' as _i33;
import '../../domin/use_cases/get_products_by_category_use_case.dart' as _i688;
import '../../domin/use_cases/get_products_by_occasion_use_case.dart' as _i176;
import '../../domin/use_cases/get_profile_info_use_case.dart' as _i911;
import '../../domin/use_cases/get_user_status_use_case.dart' as _i799;
import '../../domin/use_cases/guest_login_use_case.dart' as _i917;
import '../../domin/use_cases/load_all_cities_use_case.dart' as _i578;
import '../../domin/use_cases/load_areas_related_to_city_use_case.dart'
    as _i587;
import '../../domin/use_cases/login_use_case.dart' as _i1073;
import '../../domin/use_cases/logout_use_case.dart' as _i769;
import '../../domin/use_cases/occasion_use_case.dart' as _i1046;
import '../../domin/use_cases/register_use_case.dart' as _i638;
import '../../domin/use_cases/remove_address_use_case.dart' as _i1049;
import '../../domin/use_cases/reset_password_use_case.dart' as _i670;
import '../../domin/use_cases/update_address_use_case.dart' as _i238;
import '../../domin/use_cases/update_profile_info_use_case.dart' as _i981;
import '../../domin/use_cases/upload_profile_image_use_case.dart' as _i603;
import '../../domin/use_cases/verify_reset_code_use_case.dart' as _i643;
import '../../presentation/address/view_models/address_view_model.dart'
    as _i198;
import '../../presentation/auth/forget_password/view_models/forget_password_view_model.dart'
    as _i132;
import '../../presentation/auth/login/view_models/login_cubit.dart' as _i441;
import '../../presentation/auth/register/view_models/register_view_model.dart'
    as _i490;
import '../../presentation/best_seller/view_model/best_seller_view_model_cubit.dart'
    as _i206;
import '../../presentation/cart/view_models/cart_view_model.dart' as _i1031;
import '../../presentation/categories/view_models/categories_view_model.dart'
    as _i350;
import '../../presentation/occasion/view_models/occasion_view_model.dart'
    as _i979;
import '../../presentation/order_page/view_model/order_view_model.dart'
    as _i644;
import '../../presentation/product_details/view_model/product_details_view_model_cubit.dart'
    as _i5;
import '../../presentation/profile/profile_view_model/change_password_view_model/change_password_view_model_cubit.dart'
    as _i225;
import '../../presentation/profile/profile_view_model/edit_profile_view_model/edit_profile_cubit.dart'
    as _i633;
import '../../presentation/profile/profile_view_model/main_profile_view_model/main_profile_view_model.dart'
    as _i641;
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
    gh.factory<_i973.AddressLocalDataSource>(
      () => _i734.AddressLocalDataSourceImpl(),
    );
    gh.factory<_i508.ApiClient>(() => _i508.ApiClient.new(gh<_i361.Dio>()));
    gh.factory<_i891.AuthLocalDataSource>(
      () => _i914.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i697.AuthRemoteDataSource>(
      () => _i222.AuthRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i107.OrdersRemoteDataSource>(
      () => _i898.OrdersRemoteDataSourceImpl(apiClient: gh<_i508.ApiClient>()),
    );
    gh.factory<_i783.AddressRemoteDataSource>(
      () => _i576.AddressRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i340.AuthRepo>(
      () => _i653.AuthRepoImpl(
        gh<_i697.AuthRemoteDataSource>(),
        gh<_i891.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i555.OrdersRepo>(
      () => _i688.OrdersRepoImp(
        ordersRemoteDataSource: gh<_i107.OrdersRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i257.ChangePasswordProfileUseCase>(
      () => _i257.ChangePasswordProfileUseCase(gh<_i340.AuthRepo>()),
    );
    gh.lazySingleton<_i911.GetProfileInfoUseCase>(
      () => _i911.GetProfileInfoUseCase(gh<_i340.AuthRepo>()),
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
    gh.lazySingleton<_i981.UpdateProfileInfoUseCase>(
      () => _i981.UpdateProfileInfoUseCase(gh<_i340.AuthRepo>()),
    );
    gh.lazySingleton<_i603.UploadProfileImageUseCase>(
      () => _i603.UploadProfileImageUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i213.ForgetPasswordUseCase>(
      () => _i213.ForgetPasswordUseCase(gh<_i340.AuthRepo>()),
    );
    gh.factory<_i769.LogoutUseCase>(
      () => _i769.LogoutUseCase(gh<_i340.AuthRepo>()),
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
    gh.lazySingleton<_i702.BestSellerRemoteDataSource>(
      () => _i480.BestSellerRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i986.CartRemoteDataSource>(
      () => _i279.CartRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i1000.ProductsRemoteDataSource>(
      () => _i950.ProductsRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i802.OccasionRemoteDataSource>(
      () => _i854.OccasionRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i490.RegisterViewModel>(
      () => _i490.RegisterViewModel(gh<_i638.RegisterUseCase>()),
    );
    gh.factory<_i84.CategoriesRemoteDataSource>(
      () => _i451.CategoriesRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i547.CartRepo>(
      () => _i418.CartRepoImpl(gh<_i986.CartRemoteDataSource>()),
    );
    gh.factory<_i579.AddressRepo>(
      () => _i136.AddressRepoImpl(
        gh<_i783.AddressRemoteDataSource>(),
        gh<_i973.AddressLocalDataSource>(),
      ),
    );
    gh.factory<_i641.MainProfileViewModel>(
      () => _i641.MainProfileViewModel(
        gh<_i911.GetProfileInfoUseCase>(),
        gh<_i799.GetUserStatusUseCase>(),
        gh<_i769.LogoutUseCase>(),
      ),
    );
    gh.factory<_i633.EditProfileCubit>(
      () => _i633.EditProfileCubit(
        gh<_i911.GetProfileInfoUseCase>(),
        gh<_i981.UpdateProfileInfoUseCase>(),
        gh<_i603.UploadProfileImageUseCase>(),
      ),
    );
    gh.factory<_i225.ChangePasswordViewModelCubit>(
      () => _i225.ChangePasswordViewModelCubit(
        gh<_i257.ChangePasswordProfileUseCase>(),
      ),
    );
    gh.factory<_i132.ForgetPasswordViewModel>(
      () => _i132.ForgetPasswordViewModel(
        gh<_i213.ForgetPasswordUseCase>(),
        gh<_i643.VerifyResetCodeUseCase>(),
        gh<_i670.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i679.ProductsRepo>(
      () => _i177.ProductsRepoImpl(gh<_i1000.ProductsRemoteDataSource>()),
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
    gh.factory<_i512.GetAllProductsUseCase>(
      () => _i512.GetAllProductsUseCase(gh<_i679.ProductsRepo>()),
    );
    gh.factory<_i688.GetProductsByCategoryUseCase>(
      () => _i688.GetProductsByCategoryUseCase(gh<_i679.ProductsRepo>()),
    );
    gh.lazySingleton<_i135.BestSellerRepo>(
      () => _i663.BestSellerRepoImpl(gh<_i702.BestSellerRemoteDataSource>()),
    );
    gh.factory<_i33.GetOrdersUseCase>(
      () => _i33.GetOrdersUseCase(repo: gh<_i555.OrdersRepo>()),
    );
    gh.factory<_i5.ProductDetailsViewModelCubit>(
      () =>
          _i5.ProductDetailsViewModelCubit(gh<_i449.AddProductToCartUseCase>()),
    );
    gh.factory<_i176.GetProductsByOccasionUseCase>(
      () => _i176.GetProductsByOccasionUseCase(gh<_i679.ProductsRepo>()),
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
    gh.factory<_i983.CategoriesRepo>(
      () => _i1008.CategoriesRepoImpl(gh<_i84.CategoriesRemoteDataSource>()),
    );
    gh.factory<_i865.AddAddressUseCase>(
      () => _i865.AddAddressUseCase(gh<_i579.AddressRepo>()),
    );
    gh.factory<_i705.GetLoggedUserAddressesUseCase>(
      () => _i705.GetLoggedUserAddressesUseCase(gh<_i579.AddressRepo>()),
    );
    gh.factory<_i578.LoadAllCitiesUseCase>(
      () => _i578.LoadAllCitiesUseCase(gh<_i579.AddressRepo>()),
    );
    gh.factory<_i587.LoadAreasRelatedToCityUseCase>(
      () => _i587.LoadAreasRelatedToCityUseCase(gh<_i579.AddressRepo>()),
    );
    gh.factory<_i1049.RemoveAddressUseCase>(
      () => _i1049.RemoveAddressUseCase(gh<_i579.AddressRepo>()),
    );
    gh.factory<_i238.UpdateAddressUseCase>(
      () => _i238.UpdateAddressUseCase(gh<_i579.AddressRepo>()),
    );
    gh.factory<_i657.OccasionRepo>(
      () => _i847.OccasionRepoImpl(gh<_i802.OccasionRemoteDataSource>()),
    );
    gh.lazySingleton<_i706.GetBestSellerUseCase>(
      () => _i706.GetBestSellerUseCase(gh<_i135.BestSellerRepo>()),
    );
    gh.factory<_i81.GetAllCategoriesUseCase>(
      () => _i81.GetAllCategoriesUseCase(gh<_i983.CategoriesRepo>()),
    );
    gh.factory<_i644.OrderViewModel>(
      () => _i644.OrderViewModel(gh<_i33.GetOrdersUseCase>()),
    );
    gh.factory<_i206.BestSellerViewModelCubit>(
      () => _i206.BestSellerViewModelCubit(
        gh<_i706.GetBestSellerUseCase>(),
        gh<_i449.AddProductToCartUseCase>(),
      ),
    );
    gh.factory<_i1046.OccasionUseCase>(
      () => _i1046.OccasionUseCase(gh<_i657.OccasionRepo>()),
    );
    gh.singleton<_i198.AddressViewModel>(
      () => _i198.AddressViewModel(
        gh<_i705.GetLoggedUserAddressesUseCase>(),
        gh<_i865.AddAddressUseCase>(),
        gh<_i238.UpdateAddressUseCase>(),
        gh<_i1049.RemoveAddressUseCase>(),
        gh<_i578.LoadAllCitiesUseCase>(),
        gh<_i587.LoadAreasRelatedToCityUseCase>(),
      ),
    );
    gh.factory<_i350.CategoriesViewModel>(
      () => _i350.CategoriesViewModel(
        gh<_i81.GetAllCategoriesUseCase>(),
        gh<_i688.GetProductsByCategoryUseCase>(),
        gh<_i512.GetAllProductsUseCase>(),
        gh<_i449.AddProductToCartUseCase>(),
      ),
    );
    gh.factory<_i979.OccasionViewModel>(
      () => _i979.OccasionViewModel(
        gh<_i1046.OccasionUseCase>(),
        gh<_i176.GetProductsByOccasionUseCase>(),
        gh<_i449.AddProductToCartUseCase>(),
      ),
    );
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}

class _$SecureStorageModule extends _i260.SecureStorageModule {}
