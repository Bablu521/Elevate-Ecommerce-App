import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/editprofile.dart';
import 'package:elevate_ecommerce_app/domin/repositories/profile/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class EditProfileUseCase{
  EditProfileRepo editProfileRepo;
  EditProfileUseCase({required this.editProfileRepo});

  Future<ApiResult<EditProfileEntity>> call()async{
    return await editProfileRepo.editProfile();
}

}