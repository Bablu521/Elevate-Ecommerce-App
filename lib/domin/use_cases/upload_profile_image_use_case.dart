import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/upload_image_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UploadProfileImageUseCase {
  final AuthRepo _authRepo;

  UploadProfileImageUseCase(this._authRepo);
  Future<ApiResult<UploadImageEntity>> call(MultipartFile pram) async {
    return await _authRepo.uploadImageProfile(photo: pram);
  }
}
