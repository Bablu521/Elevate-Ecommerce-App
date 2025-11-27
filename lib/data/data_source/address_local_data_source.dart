import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';

abstract interface class AddressLocalDataSource {
  Future<List<CityEntity>> loadAllCities();
  Future<List<AreaEntity>> loadAllAreas();
}