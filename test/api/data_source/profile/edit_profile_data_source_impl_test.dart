import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/profile/edit_profile_data_source_impl.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/profile/edit_profile.dart';
import 'package:elevate_ecommerce_app/api/models/responses/auth/profile/user.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/editprofile.dart';
import 'package:elevate_ecommerce_app/domin/models/response/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_profile_data_source_impl_test.mocks.dart';
@GenerateMocks([ApiClient])
void main() {


  test('should return success when editProfile succeeds', () async {
    final mockApiClient = MockApiClient();
    final editProfileRemoteDataSourceImpl = EditProfileRemoteDataSourceImpl(apiClient: mockApiClient);

    String token = "token";

    when(mockApiClient.editProfile(any)).thenAnswer((_) async => EditProfileDto(
      user: UserDto(firstName: "Mohamed", lastName: "Naeem",email: "mo"),
      message: "success",
    ));

    final result = await editProfileRemoteDataSourceImpl.editProfile();

    expect(result, isA<ApiSuccessResult<EditProfileEntity>>());
    final success = result as ApiSuccessResult<EditProfileEntity>;
    expect(success.data.message, "success");
    expect(success.data.user, equals( UserEntity(
      Id: null,
      firstName: "Mohamed",
      lastName: "Naeem",
      email: "mo",
      password:null,
      gender: null,
      phone: null,
      photo: null,
      role: null,
      wishlist:null,
      addresses:null,
      createdAt: null,
    ),));
    expect(success.data.user?.firstName, "Mohamed");
  });

}