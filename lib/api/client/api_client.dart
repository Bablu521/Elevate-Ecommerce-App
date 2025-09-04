import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/end_points.dart';
import '../models/responses/auth/profile/edit_profile.dart';
part 'api_client.g.dart';


@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @PUT(Endpoints.editProfile)
  Future<EditProfileDto> editProfile(
      @Header("Authorization") String token,
      );
}
