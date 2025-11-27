import 'package:elevate_ecommerce_app/domin/entities/home_entity.dart';

import '../../../core/api_result/api_result.dart';

abstract class HomeRemoteDataSource{
  Future<ApiResult<HomeEntity>> getHome();
}