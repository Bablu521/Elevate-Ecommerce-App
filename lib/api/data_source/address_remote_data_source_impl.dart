import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/address_request_dto/address_request_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/address_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressRemoteDataSource)
class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final ApiClient _apiClient;
  const AddressRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<AddressEntity>>> getLoggedUserAddresses() {
    return safeApiCall(
      () => _apiClient.getLoggedUserAddresses(),
      (response) =>
          response.address!.map((item) => item.toAddressEntity()).toList(),
    );
  }

  @override
  Future<ApiResult<List<AddressEntity>>> addAddress(
    AddressRequestEntity addressRequestEntity,
  ) {
    return safeApiCall(
      () => _apiClient.addAddress(
        AddressRequestDto.fromDomain(addressRequestEntity),
      ),
      (response) =>
          response.address!.map((item) => item.toAddressEntity()).toList(),
    );
  }

  @override
  Future<ApiResult<List<AddressEntity>>> updateAddress(
    AddressRequestEntity addressRequestEntity,
    String addressId,
  ) {
    return safeApiCall(
      () => _apiClient.updateAddress(
        AddressRequestDto.fromDomain(addressRequestEntity),
        addressId,
      ),
      (response) =>
          response.address!.map((item) => item.toAddressEntity()).toList(),
    );
  }

  @override
  Future<ApiResult<List<AddressEntity>>> removeAddress(String addressId) {
    return safeApiCall(
      () => _apiClient.removeAddress(addressId),
      (response) =>
          response.address!.map((item) => item.toAddressEntity()).toList(),
    );
  }
}
