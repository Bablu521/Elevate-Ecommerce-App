import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/models/response/editprofile.dart';
import 'package:elevate_ecommerce_app/domin/models/response/user.dart';
import 'package:elevate_ecommerce_app/domin/use_case/edit_profile_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/profile/view_model/profile_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/profile/view_model/profile_states.dart';
import 'package:elevate_ecommerce_app/presentation/profile/view_model/profile_event.dart';

import 'profile_view_model_test.mocks.dart';

@GenerateMocks([EditProfileUseCase])
void main() {

  provideDummy<ApiResult<EditProfileEntity>>(
    ApiSuccessResult(
       EditProfileEntity(message: "dummy"),
    ),
  );

  group("ProfileViewModel test", () {
    late MockEditProfileUseCase mockEditProfileUseCase;

    setUp(() {
      mockEditProfileUseCase = MockEditProfileUseCase();
    });

    final profileResponse =  EditProfileEntity(
      message: "success",
      user: const UserEntity(
        firstName: "Mohamed",
        lastName: "Naeem",
        email: "mo@test.com",
      ),
    );

    final expectedResult = ApiSuccessResult(profileResponse);

    blocTest<ProfileViewModel, ProfileStates>(
      "emits loading then success when OnLoadProfileEvent is added",
      build: () {
        when(mockEditProfileUseCase.call())
            .thenAnswer((_) async => expectedResult);
        return ProfileViewModel(mockEditProfileUseCase);
      },
      act: (viewModel) => viewModel.doIntent(OnLoadProfileEvent()),
      expect: () => [
         const ProfileStates(profileListIsLoading: true),
        ProfileStates(
          profileListIsLoading: false,
          profileListSuccess: profileResponse,
        ),
      ],
      verify: (_) {
        verify(mockEditProfileUseCase.call()).called(1);
      },
    );
    const errorMessage = "network failed";
    final expectedErrorResult = ApiErrorResult<EditProfileEntity>(errorMessage);

    blocTest<ProfileViewModel, ProfileStates>(
      "emits loading then error when OnLoadProfileEvent fails",
      build: () {
        when(mockEditProfileUseCase.call())
            .thenAnswer((_) async => expectedErrorResult);
        return ProfileViewModel(mockEditProfileUseCase);
      },
      act: (viewModel) => viewModel.doIntent(OnLoadProfileEvent()),
      expect: () => [
        const ProfileStates(profileListIsLoading: true),
        const ProfileStates(
          profileListIsLoading: false,
          profileListErrorMessage: errorMessage,
        ),
      ],
      verify: (_) {
        verify(mockEditProfileUseCase.call()).called(1);
      },
    );
  });
}

