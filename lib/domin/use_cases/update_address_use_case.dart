import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateAddressUseCase {
  final AddressRepo _addressRepo;
  const UpdateAddressUseCase(this._addressRepo);

  Future<ApiResult<List<AddressEntity>>> call(
    AddressRequestEntity addressRequestEntity,
    String addressId,
  ) {
    return _addressRepo.updateAddress(addressRequestEntity, addressId);
  }
}
