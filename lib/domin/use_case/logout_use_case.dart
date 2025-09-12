import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/logout_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/profile/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class LogOutUseCase{
  EditProfileRepo editProfileRepo;
  LogOutUseCase({required this.editProfileRepo});

  Future<ApiResult<LogOutEntity>> call()async{
    return await editProfileRepo.logOut();
  }

}