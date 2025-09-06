import 'package:elevate_ecommerce_app/api/models/responses/profile/change_password_response/change_password_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/update_profile_info_response/update_profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/upload_image_response/upload_image_response_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/domin/entities/update_profile_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/change_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/upload_image_entity.dart';

abstract class ProfileMapper {
  static ChangePasswordEntity changePasswordFromResponse(
    ChangePasswordResponseDto response,
  ) {
    return ChangePasswordEntity(
      token: response.token ?? ConstKeys.kNoToken,
      message: response.message ?? "",
    );
  }

  static UploadImageEntity uploadImageFromResponse(
    UploadImageResponseDto response,
  ) {
    return UploadImageEntity(message: response.message ?? "");
  }

  static ProfileInfoEntity profileFromResponse(
    ProfileInfoResponseDto response,
  ) {
    return ProfileInfoEntity(
      message: response.message ?? '',
      email: response.user?.email ?? '',
      firstName: response.user?.firstName ?? '',
      lastName: response.user?.lastName ?? '',
      gender: response.user?.gender ?? '',
      phone: response.user?.phone ?? '',
      imagePath: response.user?.photo ?? AppImages.profileImageTest,
    );
  }

  static UpdateProfileEntity updateProfileFromResponse(
    UpdateProfileInfoResponseDto response,
  ) {
    return UpdateProfileEntity(
      message: response.message ?? '',
      email: response.user?.email ?? '',
      firstName: response.user?.firstName ?? '',
      lastName: response.user?.lastName ?? '',
      gender: response.user?.gender ?? '',
      phone: response.user?.phone ?? '',
      photo: response.user?.photo ?? AppImages.profileImageTest,
    );
  }
}
