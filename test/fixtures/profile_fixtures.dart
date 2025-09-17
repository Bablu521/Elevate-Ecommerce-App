import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/change_password_response/change_password_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/user_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/update_profile_info_response/update_profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/update_profile_info_response/update_profile_user_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/upload_image_response/upload_image_response_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/update_profile_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/upload_image_entity.dart';

abstract class ProfileFixtures {
  // 🟢 Fake User
  static final UserDto fakeUser = UserDto(
    id: "68a56145a8bca307f9df10a9",
    firstName: "Moaz",
    lastName: "Tech2",
    email: "moaz@test.com",
    gender: "male",
    phone: "+201010700599",
    photo: "https://flower.elevateegy.com/uploads/fake-photo.png",
    role: "user",
    wishlist: [],
    addresses: [],
    createdAt: "2025-08-20T05:46:45.605Z",
    passwordChangedAt: "2025-09-02T17:39:54.493Z",
  );
  static final fakeUserUpdateDate = UserDtoUpdateProfile(
    id: "68a56145a8bca307f9df10a9",
    firstName: "Moaz",
    lastName: "Tech2",
    email: "moaz@test.com",
    password: "hashedPassword123",
    gender: "male",
    phone: "+201010700599",
    photo: "https://flower.elevateegy.com/uploads/fake-photo.png",
    role: "user",
    wishlist: [],
    addresses: [],
    createdAt: "2025-08-20T05:46:45.605Z",
    passwordChangedAt: "2025-09-02T17:39:54.493Z",
  );

  // 🟢 Fake Profile Info Response
  static final ProfileInfoResponseDto fakeProfileInfoResponse =
      ProfileInfoResponseDto(message: "success", user: fakeUser);

  // 🟢 Fake Update Profile Request
  static final UpdateProfileInfoRequest fakeUpdateProfileRequest =
      const UpdateProfileInfoRequest(
        firstName: "Moaz",
        lastName: "Updated",
        email: "moaz.updated@test.com",
        phone: "+201011111111",
      );

  // 🟢 Fake Update Profile Response
  static final UpdateProfileInfoResponseDto fakeUpdateProfileResponse =
      UpdateProfileInfoResponseDto(
        message: "Profile updated successfully",
        user: fakeUserUpdateDate,
      );

  // 🟢 Fake Change Password Request
  static final ChangePasswordRequest fakeChangePasswordRequest =
      const ChangePasswordRequest(
        password: "oldPass123",
        newPassword: "newPass456",
      );

  // 🟢 Fake Change Password Response
  static final ChangePasswordResponseDto fakeChangePasswordResponse =
      const ChangePasswordResponseDto(
        message: "Password changed successfully",
        token: "fake-jwt-token",
      );

  // 🟢 Fake Upload Image Response
  static final UploadImageResponseDto fakeUploadImageResponse =
      const UploadImageResponseDto(message: "Image uploaded successfully");

  static final ProfileInfoEntity fakeProfileInfoEntity = ProfileInfoEntity(
    message: "success",
    email: fakeUser.email!,
    firstName: fakeUser.firstName!,
    lastName: fakeUser.lastName!,
    gender: fakeUser.gender!,
    phone: fakeUser.phone!,
    imagePath: fakeUser.photo!,
  );
  static final UpdateProfileEntity updateProfileEntity = UpdateProfileEntity(
    message: "success",
    firstName: fakeUserUpdateDate.firstName!,
    lastName: fakeUserUpdateDate.lastName!,
    email: fakeUserUpdateDate.email!,
    gender: fakeUserUpdateDate.gender!,
    phone: fakeUserUpdateDate.phone!,
    photo: fakeUserUpdateDate.photo!,
  );
  static final UploadImageEntity uploadImageEntity = UploadImageEntity(
    message: fakeUploadImageResponse.message!,
  );
}
