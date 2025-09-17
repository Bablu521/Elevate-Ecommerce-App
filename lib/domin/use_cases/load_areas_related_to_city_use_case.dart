import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadAreasRelatedToCityUseCase {
  final AddressRepo _addressRepo;
  const LoadAreasRelatedToCityUseCase(this._addressRepo);

  Future<List<AreaEntity>> call(String cityId) {
    return _addressRepo.loadAreasRelatedToCity(cityId);
  }
}
