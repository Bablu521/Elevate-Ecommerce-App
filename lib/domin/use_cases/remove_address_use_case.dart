import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveAddressUseCase {
  final AddressRepo _addressRepo;
  const RemoveAddressUseCase(this._addressRepo);

  Future<ApiResult<List<AddressEntity>>> call(String addressId) {
    return _addressRepo.removeAddress(addressId);
  }
}
