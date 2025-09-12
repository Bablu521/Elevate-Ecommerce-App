import 'package:elevate_ecommerce_app/api/models/responses/auth/profile/edit_profile.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/profile/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call edit profile with null value return editProfile with null value', () {
    final EditProfileDto editProfileDto=EditProfileDto(
      user: null,
      message: null,
    );
    final result =editProfileDto.toEditProfileEntity();
    expect(result.message, null);
    expect(result.user, null);
  });
  test('when call edit profile with non-null value '
      'return editProfile with right value', () {
    final EditProfileDto editProfileDto=EditProfileDto(
      user:UserDto() ,
      message: "asasd",
    );
    final result =editProfileDto.toEditProfileEntity();
    expect(result.message, equals(editProfileDto.message));
    // expect(result.user, equals(editProfileDto.user?.toUserEntity()));
  });
}