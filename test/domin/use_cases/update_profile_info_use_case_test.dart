import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/update_profile_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/update_profile_info_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/profile_fixtures.dart';
import 'get_user_status_use_case_test.mocks.dart';

@GenerateMocks([AuthRepoImpl])
void main() {
  late MockAuthRepoImpl mockAuthRepoImpl;
  late UpdateProfileInfoUseCase updateProfileInfoUseCase;
  final UpdateProfileEntity updateProfileEntity =
      ProfileFixtures.updateProfileEntity;
  final UpdateProfileInfoRequest updateProfileInfoRequest =
      ProfileFixtures.fakeUpdateProfileRequest;
  final DioException dioException = DioException(
    requestOptions: RequestOptions(),
    message: "fake_dio_error",
  );
  setUp(() {
    mockAuthRepoImpl = MockAuthRepoImpl();
    updateProfileInfoUseCase = UpdateProfileInfoUseCase(mockAuthRepoImpl);
    provideDummy<ApiResult<UpdateProfileEntity>>(
      ApiSuccessResult<UpdateProfileEntity>(updateProfileEntity),
    );
    provideDummy<ApiResult<UpdateProfileEntity>>(
      ApiErrorResult<UpdateProfileEntity>(dioException),
    );
  });
  group("change password use case", () {
    test("test success", () async {
      //Arrange
      final expectResult = ApiSuccessResult<UpdateProfileEntity>(
        updateProfileEntity,
      );
      when(
        mockAuthRepoImpl.updateProfileInfo(request: updateProfileInfoRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await updateProfileInfoUseCase.call(
        updateProfileInfoRequest,
      );
      //Assert
      expect(result, isA<ApiSuccessResult<UpdateProfileEntity>>());
      expect(
        (result as ApiSuccessResult<UpdateProfileEntity>).data.phone,
        equals(updateProfileEntity.phone),
      );
      verify(
        mockAuthRepoImpl.updateProfileInfo(request: updateProfileInfoRequest),
      ).called(1);
    });
    test("test error", () async {
      //Arrange
      final expectResult = ApiErrorResult<UpdateProfileEntity>(dioException);
      when(
        mockAuthRepoImpl.updateProfileInfo(request: updateProfileInfoRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await updateProfileInfoUseCase.call(
        updateProfileInfoRequest,
      );
      //Assert
      expect(result, isA<ApiErrorResult<UpdateProfileEntity>>());
      expect(
        (result as ApiErrorResult<UpdateProfileEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
      verify(
        mockAuthRepoImpl.updateProfileInfo(request: updateProfileInfoRequest),
      ).called(1);
    });
  });
}
