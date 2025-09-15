import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadAllCitiesUseCase {
  final AddressRepo _addressRepo;
  const LoadAllCitiesUseCase(this._addressRepo);

  Future<List<CityEntity>> call() {
    return _addressRepo.loadAllCities();
  }
}
