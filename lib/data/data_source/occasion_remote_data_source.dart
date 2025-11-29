import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';

abstract interface class OccasionRemoteDataSource {
  Future<ApiResult<List<OccasionEntity>>> getAllOccasions();
}