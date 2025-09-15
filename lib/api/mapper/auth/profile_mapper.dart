import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';

abstract class ProfileMapper {
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

}