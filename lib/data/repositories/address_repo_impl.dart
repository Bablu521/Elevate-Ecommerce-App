import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/address_local_data_source.dart';
import 'package:elevate_ecommerce_app/data/data_source/address_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/address_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressRepo)
class AddressRepoImpl implements AddressRepo {
  final AddressRemoteDataSource _addressRemoteDataSource;
  final AddressLocalDataSource _addressLocalDataSource;
  const AddressRepoImpl(
      this._addressRemoteDataSource,
      this._addressLocalDataSource,
      );

  @override
  Future<ApiResult<List<AddressEntity>>> getLoggedUserAddresses() {
    return _addressRemoteDataSource.getLoggedUserAddresses();
  }

  @override
  Future<ApiResult<List<AddressEntity>>> addAddress(
      AddressRequestEntity addressRequestEntity,
      ) {
    return _addressRemoteDataSource.addAddress(addressRequestEntity);
  }

  @override
  Future<ApiResult<List<AddressEntity>>> updateAddress(
      AddressRequestEntity addressRequestEntity,
      String addressId,
      ) {
    return _addressRemoteDataSource.updateAddress(
      addressRequestEntity,
      addressId,
    );
  }

  @override
  Future<ApiResult<List<AddressEntity>>> removeAddress(String addressId) {
    return _addressRemoteDataSource.removeAddress(addressId);
  }

  @override
  Future<List<CityEntity>> loadAllCities() {
    return _addressLocalDataSource.loadAllCities();
  }

  @override
  Future<List<AreaEntity>> loadAreasRelatedToCity(String cityId) async {
    final allAreas = await _addressLocalDataSource.loadAllAreas();
    return allAreas.where((area) => area.cityId == cityId).toList();
  }
}