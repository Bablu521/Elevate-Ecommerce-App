import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';

abstract interface class AddressRemoteDataSource {

  Future<ApiResult<List<AddressEntity>>> getLoggedUserAddresses();

  Future<ApiResult<List<AddressEntity>>> addAddress(
      AddressRequestEntity addressRequestEntity,
      );

  Future<ApiResult<List<AddressEntity>>> updateAddress(
      AddressRequestEntity addressRequestEntity,
      String addressId,
      );

  Future<ApiResult<List<AddressEntity>>> removeAddress(String addressId);

}