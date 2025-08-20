import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResult<RegisterEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  );
}
