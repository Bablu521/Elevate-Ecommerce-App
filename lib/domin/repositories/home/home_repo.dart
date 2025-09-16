import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/home_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<HomeEntity>> getHome();
}
