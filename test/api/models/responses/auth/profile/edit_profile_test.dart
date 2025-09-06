import 'package:elevate_ecommerce_app/api/models/responses/auth/profile/edit_profile.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/profile/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call edit profile with null value return editProfile with null value', () {
    // TODO: Implement test
    EditProfileDto editProfileDto=EditProfileDto(
      user: null,
      message: null,
    );
    var result =editProfileDto.toEditProfileEntity();
    expect(result.message, null);
    expect(result.user, null);
  });
  test('when call edit profile with non-null value '
      'return editProfile with right value', () {
    // TODO: Implement test
    final EditProfileDto editProfileDto=EditProfileDto(
      user:UserDto() ,
      message: "asasd",
    );
    var result =editProfileDto.toEditProfileEntity();
    expect(result.message, equals(editProfileDto.message));
    // expect(result.user, equals(editProfileDto.user?.toUserEntity()));
  });
}