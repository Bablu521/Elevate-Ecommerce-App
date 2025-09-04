import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/profile/edit_profile_remote_data_source.dart';
import 'package:elevate_ecommerce_app/data/repositories/profile/edit_profile_impl.dart';
import 'package:elevate_ecommerce_app/domin/models/response/editprofile.dart';
import 'package:elevate_ecommerce_app/domin/models/response/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_profile_impl_test.mocks.dart';

@GenerateMocks([EditProfileRemoteDataSource])
void main() {
  test('when call editProfile it should editProfile from data source with correct parameters', () async{
    // Arrange
    final mockDataSource   =MockEditProfileRemoteDataSource();

    final editProfileRepoImpl =EditProfileRepoImpl( editProfileRemoteDataSource: mockDataSource);

    final expectedResult=ApiSuccessResult(EditProfileEntity(
      message: "success",
      user: UserEntity(firstName: "Mohamed", lastName: "Naeem",email: "mo")
    ));

    provideDummy<ApiResult<EditProfileEntity>>(expectedResult);

    when(mockDataSource.editProfile()).thenAnswer((_) async=> expectedResult );

    // Act

     final response= await editProfileRepoImpl.editProfile();

     //assert
    verify(mockDataSource.editProfile()).called(1);
    expect(response, isA<ApiSuccessResult<EditProfileEntity>>());
    final success = response as ApiSuccessResult<EditProfileEntity>;
    expect(success.data, equals(expectedResult.data));
 
  });


}