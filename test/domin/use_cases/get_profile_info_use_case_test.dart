import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_profile_info_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/profile_fixtures.dart';
import 'get_user_status_use_case_test.mocks.dart';

@GenerateMocks([AuthRepoImpl])
void main() {
  late MockAuthRepoImpl mockAuthRepoImpl;
  late GetProfileInfoUseCase profileInfoUseCase;
  final ProfileInfoEntity profileInfoEntity =
      ProfileFixtures.fakeProfileInfoEntity;
  final DioException dioException = DioException(
    requestOptions: RequestOptions(),
    message: "fake_dio_error",
  );
  setUp(() {
    mockAuthRepoImpl = MockAuthRepoImpl();
    profileInfoUseCase = GetProfileInfoUseCase(mockAuthRepoImpl);
    provideDummy<ApiResult<ProfileInfoEntity>>(
      ApiSuccessResult<ProfileInfoEntity>(profileInfoEntity),
    );
    provideDummy<ApiResult<ProfileInfoEntity>>(
      ApiErrorResult<ProfileInfoEntity>(dioException),
    );
  });
  group("get profile use case", () {
    test("test success", () async {
      //Arrange
      final expectResult = ApiSuccessResult<ProfileInfoEntity>(
        profileInfoEntity,
      );
      when(
        mockAuthRepoImpl.getProfileInfo(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await profileInfoUseCase.call();
      //Assert
      expect(result, isA<ApiSuccessResult<ProfileInfoEntity>>());
      expect(
        (result as ApiSuccessResult<ProfileInfoEntity>).data.firstName,
        equals(profileInfoEntity.firstName),
      );
      verify(mockAuthRepoImpl.getProfileInfo()).called(1);
    });
    test("test error", () async {
      //Arrange
      final expectResult = ApiErrorResult<ProfileInfoEntity>(dioException);
      when(
        mockAuthRepoImpl.getProfileInfo(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await profileInfoUseCase.call();
      //Assert
      expect(result, isA<ApiErrorResult<ProfileInfoEntity>>());
      expect(
        (result as ApiErrorResult<ProfileInfoEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
      verify(mockAuthRepoImpl.getProfileInfo()).called(1);
    });
  });
}
