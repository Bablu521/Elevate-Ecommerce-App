import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/data/repositories/occasion_repo_impl.dart';
import 'package:elevate_ecommerce_app/data/data_source/occasion_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_repo_impl_test.mocks.dart';

@GenerateMocks([OccasionRemoteDataSource])
void main() {
  group('test OccasionRepoImpl', () {
    late MockOccasionRemoteDataSource mockedOccasionRemoteDataSource;
    late OccasionRepoImpl occasionRepoImpl;
    setUp(() {
      mockedOccasionRemoteDataSource = MockOccasionRemoteDataSource();
      occasionRepoImpl = OccasionRepoImpl(mockedOccasionRemoteDataSource);
    });
    test(
      'when call getAllOccasions it should return a list of occasions from data source with right parameters',
      () async {
        //Arrange
        final expectedOccasions = [
          OccasionEntity(
            id: "fake-id-1",
            name: "fake-name-1",
            slug: "fake-slug-1",
            image: "fake-image-1",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            isSuperAdmin: false,
            productsCount: 0,
          ),
          OccasionEntity(
            id: "fake-id-2",
            name: "fake-name-2",
            slug: "fake-slug-2",
            image: "fake-image-2",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            isSuperAdmin: false,
            productsCount: 0,
          ),
        ];
        final expectedResult = ApiSuccessResult(expectedOccasions);
        provideDummy<ApiResult<List<OccasionEntity>>>(expectedResult);
        when(
          mockedOccasionRemoteDataSource.getAllOccasions(),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await occasionRepoImpl.getAllOccasions();

        //Assert
        verify(mockedOccasionRemoteDataSource.getAllOccasions()).called(1);
        expect(result, isA<ApiSuccessResult<List<OccasionEntity>>>());
        result as ApiSuccessResult<List<OccasionEntity>>;
        expect(result.data, equals(expectedOccasions));
      },
    );

    test(
      'when getAllOccasions failed it should return an error result',
      () async {
        //Arrange
        final expectedError = "Server Error";
        final expectedResult = ApiErrorResult<List<OccasionEntity>>(
          expectedError,
        );
        provideDummy<ApiResult<List<OccasionEntity>>>(expectedResult);
        when(
          mockedOccasionRemoteDataSource.getAllOccasions(),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await occasionRepoImpl.getAllOccasions();

        //Assert
        verify(mockedOccasionRemoteDataSource.getAllOccasions()).called(1);
        expect(result, isA<ApiErrorResult<List<OccasionEntity>>>());
        result as ApiErrorResult<List<OccasionEntity>>;
        expect(result.errorMessage, equals(expectedError));
      },
    );

  });
}
