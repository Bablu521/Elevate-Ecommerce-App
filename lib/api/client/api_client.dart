import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/responses/occasions_reponse_dto/occasions_reponse_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';


@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  
  @GET(Endpoints.occasions)
  Future<OccasionsReponseDto> getAllOccasions();
}
