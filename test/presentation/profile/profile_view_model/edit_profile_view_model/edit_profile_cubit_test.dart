import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/update_profile_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_profile_info_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/update_profile_info_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/upload_profile_image_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/edit_profile_view_model/edit_profile_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/edit_profile_view_model/edit_profile_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/profile_fixtures.dart';
import 'edit_profile_cubit_test.mocks.dart';

@GenerateMocks([
  UploadProfileImageUseCase,
  UpdateProfileInfoUseCase,
  GetProfileInfoUseCase,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockUpdateProfileInfoUseCase updateProfileInfoUseCase;
  late MockUploadProfileImageUseCase uploadProfileImageUseCase;
  late MockGetProfileInfoUseCase getProfileInfoUseCase;
  late EditProfileCubit editProfileCubit;
  late EditProfileState state;
  final DioException dioException = DioException(
    requestOptions: RequestOptions(),
    message: "fake_dio_error",
  );
  setUp(() {
    uploadProfileImageUseCase = MockUploadProfileImageUseCase();
    updateProfileInfoUseCase = MockUpdateProfileInfoUseCase();
    getProfileInfoUseCase = MockGetProfileInfoUseCase();
    editProfileCubit = EditProfileCubit(
      getProfileInfoUseCase,
      updateProfileInfoUseCase,
      uploadProfileImageUseCase,
    );
    state =const EditProfileState();
  });
  group("test get profile info emit state", () {
    final ProfileInfoEntity profileInfoEntity =
        ProfileFixtures.fakeProfileInfoEntity;
    setUp(() {
      provideDummy<ApiResult<ProfileInfoEntity>>(
        ApiSuccessResult<ProfileInfoEntity>(profileInfoEntity),
      );
      provideDummy<ApiResult<ProfileInfoEntity>>(
        ApiErrorResult<ProfileInfoEntity>(dioException),
      );
    });
    blocTest(
      "test emit loading and success",
      build: () => editProfileCubit,
      act: (bloc) {
        when(getProfileInfoUseCase.call()).thenAnswer(
          (_) async => ApiSuccessResult<ProfileInfoEntity>(profileInfoEntity),
        );
        bloc.doIntent(EditProfileGetInfoUser());
      },
      expect: () => [
        state.copyWith(profileInfoState: BaseState.loading()),
        state.copyWith(profileInfoState: BaseState.success(profileInfoEntity)),
      ],
      verify: (bloc) {
        verify(getProfileInfoUseCase.call()).called(1);
      },
    );
    blocTest(
      "test emit loading and failure",
      build: () => editProfileCubit,
      act: (bloc) {
        when(getProfileInfoUseCase.call()).thenAnswer(
          (_) async => ApiErrorResult<ProfileInfoEntity>(dioException),
        );
        bloc.doIntent(EditProfileGetInfoUser());
      },
      expect: () => [
        state.copyWith(profileInfoState: BaseState.loading()),
        state.copyWith(
          profileInfoState: BaseState.error(
            "An unexpected error occurred: fake_dio_error",
          ),
        ),
      ],
      verify: (bloc) {
        verify(getProfileInfoUseCase.call()).called(1);
      },
    );
  });
  group("test update profile info emit state", () {
    final UpdateProfileEntity updateProfileEntity =
        ProfileFixtures.updateProfileEntity;
    final UpdateProfileInfoRequest request =
        ProfileFixtures.fakeUpdateProfileRequest;
    setUp(() {
      provideDummy<ApiResult<UpdateProfileEntity>>(
        ApiSuccessResult<UpdateProfileEntity>(updateProfileEntity),
      );
      provideDummy<ApiResult<UpdateProfileEntity>>(
        ApiErrorResult<UpdateProfileEntity>(dioException),
      );
    });
    blocTest(
      "test emit loading and success",
      build: () => editProfileCubit,
      act: (bloc) {
        when(updateProfileInfoUseCase.call(request)).thenAnswer(
          (_) async =>
              ApiSuccessResult<UpdateProfileEntity>(updateProfileEntity),
        );
        bloc.doIntent(EditProfileUpdateProfileInfoEvent(request: request));
      },
      expect: () => [
        state.copyWith(updateProfileInfoState: BaseState.loading()),
        state.copyWith(
          updateProfileInfoState: BaseState.success(updateProfileEntity),
        ),
      ],
      verify: (bloc) {
        verify(updateProfileInfoUseCase.call(request)).called(1);
      },
    );
    blocTest(
      "test emit loading and failure",
      build: () => editProfileCubit,
      act: (bloc) {
        when(updateProfileInfoUseCase.call(request)).thenAnswer(
          (_) async => ApiErrorResult<UpdateProfileEntity>(dioException),
        );
        bloc.doIntent(EditProfileUpdateProfileInfoEvent(request: request));
      },
      expect: () => [
        state.copyWith(updateProfileInfoState: BaseState.loading()),
        state.copyWith(
          updateProfileInfoState: BaseState.error(
            "An unexpected error occurred: fake_dio_error",
          ),
        ),
      ],
      verify: (bloc) {
        verify(updateProfileInfoUseCase.call(request)).called(1);
      },
    );
  });
}
