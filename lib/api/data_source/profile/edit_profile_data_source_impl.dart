import 'package:injectable/injectable.dart';
import '../../../core/api_result/api_result.dart';
import '../../../data/data_source/profile/edit_profile_remote_data_source.dart';
import '../../../domin/models/response/editprofile.dart';
import '../../client/api_client.dart';

@Injectable(as:EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl extends EditProfileRemoteDataSource{
  ApiClient apiClient;
  EditProfileRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<ApiResult<EditProfileEntity>> editProfile()async {
     String token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjhiNzgxMTNhOGJjYTMwN2Y5ZTIxYmM5Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NTY5MDU2NTh9.H2YlIQRS9Zg4ggSN4Ed2Oj-zJsOqiideGjzr5krnUpc";
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

}
