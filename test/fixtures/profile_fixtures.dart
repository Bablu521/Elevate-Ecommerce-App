import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/profile_info_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/user_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';


abstract class ProfileFixtures {
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

  static final ProfileInfoResponseDto fakeProfileInfoResponse =
      ProfileInfoResponseDto(message: "success", user: fakeUser);

  static final ProfileInfoEntity fakeProfileInfoEntity = ProfileInfoEntity(
    message: "success",
    email: fakeUser.email!,
    firstName: fakeUser.firstName!,
    lastName: fakeUser.lastName!,
    gender: fakeUser.gender!,
    phone: fakeUser.phone!,
    imagePath: fakeUser.photo!,
  );
}