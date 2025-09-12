import 'package:elevate_ecommerce_app/domin/models/response/logout_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api_result/api_result.dart';
import '../../../core/constants/const_keys.dart';
import '../../../data/data_source/profile/edit_profile_remote_data_source.dart';
import '../../../domin/models/response/edit_profile.dart';
import '../../client/api_client.dart';

@Injectable(as:EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl extends EditProfileRemoteDataSource{
  ApiClient apiClient;
  final FlutterSecureStorage secureStorage;
  EditProfileRemoteDataSourceImpl({required this.apiClient,required this.secureStorage});

  Future<String?> _getToken() async {
    return await secureStorage.read(key: ConstKeys.keyUserToken);
  }

  @override
  Future<ApiResult<EditProfileEntity>> editProfile()async {
    var token = await _getToken();
    if (token == null) throw Exception("Token not found");
    try{
     final response = await apiClient.editProfile(
        token="Bearer $token"
     );
     final  responseEntity=response.toEditProfileEntity();
     return ApiSuccessResult(responseEntity);

    }
    catch (e){
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<LogOutEntity>> logOut() async {
    try{
      var token = await _getToken();
      if (token == null) throw Exception("Token not found");


      final response = await apiClient.logOut(
          token="Bearer $token"
      );
      await secureStorage.delete(key: ConstKeys.keyUserToken);
      final  responseEntity=response.toLogOutEntity();
      return ApiSuccessResult(responseEntity );

    }
    catch (e){
      return ApiErrorResult(e);
    }
  }

}
