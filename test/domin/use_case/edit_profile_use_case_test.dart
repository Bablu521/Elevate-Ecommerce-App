import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/edit_profile.dart';
import 'package:elevate_ecommerce_app/domin/models/response/user.dart';
import 'package:elevate_ecommerce_app/domin/repositories/profile/edit_profile_repo.dart';
import 'package:elevate_ecommerce_app/domin/use_case/edit_profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'edit_profile_use_case_test.mocks.dart';

@GenerateMocks([EditProfileRepo])
void main() {
  test('when call editProfile it should call editProfile from repo with correct parameters', () async {

    // Arrange
   final mockEditProfileRepo=MockEditProfileRepo();
    final EditProfileUseCase editProfileUseCase=EditProfileUseCase( editProfileRepo: mockEditProfileRepo);

  final expectedResult = ApiSuccessResult(const EditProfileEntity(
      message: "success",
      user: UserEntity(firstName: "Mohamed", lastName: "Naeem",email: "mo")
  ));

   provideDummy<ApiResult<EditProfileEntity>>(expectedResult);

   when(mockEditProfileRepo.editProfile()).thenAnswer((_) async => expectedResult);

    //Act
   final response= await editProfileUseCase.call();
   //Assert
   verify(mockEditProfileRepo.editProfile()).called(1);
   expect(response, isA<ApiSuccessResult<EditProfileEntity>>());
   final success = response as ApiSuccessResult<EditProfileEntity>;
   expect(success.data, equals(expectedResult.data));

  });
}