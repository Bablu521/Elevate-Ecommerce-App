import 'package:elevate_ecommerce_app/api/data_source/profile/edit_profile_data_source_impl.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/editprofile.dart';
import 'package:elevate_ecommerce_app/domin/models/response/logOutEntity.dart';
import 'package:injectable/injectable.dart';
import '../../../domin/repositories/profile/edit_profile_repo.dart';
import '../../data_source/profile/edit_profile_remote_data_source.dart';

@Injectable(as:EditProfileRepo)
class EditProfileRepoImpl extends EditProfileRepo{
 final EditProfileRemoteDataSource editProfileRemoteDataSource;

  EditProfileRepoImpl({required this.editProfileRemoteDataSource});

  @override
  Future<ApiResult<EditProfileEntity>> editProfile() async{

   try{
     final response = await editProfileRemoteDataSource.editProfile();
           return response;
   } catch (e){
     return ApiErrorResult(e);

   }

  }

  @override
  Future<ApiResult<LogOutEntity>> logOut() async {
    try{
      final response = await editProfileRemoteDataSource.logOut();
      return response;
    } catch (e){
      return ApiErrorResult(e);

    }
  }

}