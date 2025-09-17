import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/repositories/auth_repo_impl.dart';
import 'package:elevate_ecommerce_app/domin/entities/upload_image_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/upload_profile_image_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/profile_fixtures.dart';
import 'get_user_status_use_case_test.mocks.dart';

@GenerateMocks([AuthRepoImpl])
void main() {
  late MockAuthRepoImpl mockAuthRepoImpl;
  late UploadProfileImageUseCase uploadProfileImageUseCase;
  final UploadImageEntity uploadImageEntity = ProfileFixtures.uploadImageEntity;
  final MultipartFile fakeRequest = MultipartFile.fromString(
    'dummy data',
    filename: 'profile.png',
  );
  final DioException dioException = DioException(
    requestOptions: RequestOptions(),
    message: "fake_dio_error",
  );
  setUp(() {
    mockAuthRepoImpl = MockAuthRepoImpl();
    uploadProfileImageUseCase = UploadProfileImageUseCase(mockAuthRepoImpl);
    provideDummy<ApiResult<UploadImageEntity>>(
      ApiSuccessResult<UploadImageEntity>(uploadImageEntity),
    );
    provideDummy<ApiResult<UploadImageEntity>>(
      ApiErrorResult<UploadImageEntity>(dioException),
    );
  });
  group("change password use case", () {
    test("test success", () async {
      //Arrange
      final expectResult = ApiSuccessResult<UploadImageEntity>(
        uploadImageEntity,
      );
      when(
        mockAuthRepoImpl.uploadImageProfile(photo: fakeRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await uploadProfileImageUseCase.call(fakeRequest);
      //Assert
      expect(result, isA<ApiSuccessResult<UploadImageEntity>>());
      expect(
        (result as ApiSuccessResult<UploadImageEntity>).data.message,
        equals(uploadImageEntity.message),
      );
      verify(mockAuthRepoImpl.uploadImageProfile(photo: fakeRequest)).called(1);
    });
    test("test error", () async {
      //Arrange
      final expectResult = ApiErrorResult<UploadImageEntity>(dioException);
      when(
        mockAuthRepoImpl.uploadImageProfile(photo: fakeRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await uploadProfileImageUseCase.call(fakeRequest);
      //Assert
      expect(result, isA<ApiErrorResult<UploadImageEntity>>());
      expect(
        (result as ApiErrorResult<UploadImageEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
      verify(mockAuthRepoImpl.uploadImageProfile(photo: fakeRequest)).called(1);
    });
  });
}
