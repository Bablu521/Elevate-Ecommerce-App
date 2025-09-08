import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/address_request_dto/address_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/register_request_dto/register_request_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/addresses_response_dto/address_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/addresses_response_dto/addresses_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/register_response_dto/register_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(Endpoints.register)
  Future<RegisterResponseDto> register(
    @Body() RegisterRequestDto registerRequestDto,
  );

  @POST(Endpoints.signIn)
  Future<LoginResponseDto> login(@Body() LoginRequestModel loginRequestModel);

  @GET(Endpoints.address)
  Future<AddressesResponseDto> getLoggedUserAddresses();

  @PATCH(Endpoints.address)
  Future<AddressResponseDto> addAddress(
    @Body() AddressRequestDto addressRequestDto,
  );

  @PATCH('${Endpoints.address}/{id}')
  Future<AddressesResponseDto> updateAddress(
    @Body() AddressRequestDto addressRequestDto,
    @Path("id") String addressId,
  );

  @DELETE('${Endpoints.address}/{id}')
  Future<AddressResponseDto> removeAddress(@Path("id") String addressId);
}
