import 'package:elevate_ecommerce_app/api/models/occasion_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/occasions_reponse_dto/metadata.dart';
import 'package:elevate_ecommerce_app/api/models/responses/occasions_reponse_dto/occasions_reponse_dto.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/occasion_remote_data_source_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group('test OccasionRemoteDataSourceImpl', () {
    late MockApiClient mockedApiClient;
    late OccasionRemoteDataSourceImpl occasionRemoteDataSourceImpl;

    setUp(() {
      mockedApiClient = MockApiClient();
      occasionRemoteDataSourceImpl = OccasionRemoteDataSourceImpl(
        mockedApiClient,
      );
    });
    test(
      'when call getAllOccasions it should return a list of occasions from api client with right parameters',
      () async {
        //Arrange
        var expectedResult = OccasionsReponseDto(
          message: "fake-message",
          metadata: Metadata(
            currentPage: 1,
            limit: 10,
            totalPages: 1,
            totalItems: 2,
          ),
          occasions: [
            OccasionDto(
              id: "fake-id-1",
              name: "fake-name-1",
              slug: "fake-slug-1",
              image: "fake-image-1",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              isSuperAdmin: false,
              productsCount: 0,
            ),
            OccasionDto(
              id: "fake-id-2",
              name: "fake-name-2",
              slug: "fake-slug-2",
              image: "fake-image-2",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              isSuperAdmin: false,
              productsCount: 0,
            ),
          ],
        );
        when(
          mockedApiClient.getAllOccasions(),
        ).thenAnswer((_) async => expectedResult);

        //Call
        var result = await occasionRemoteDataSourceImpl.getAllOccasions();

        //Assert
        verify(mockedApiClient.getAllOccasions()).called(1);
        expect(result, isA<ApiSuccessResult<List<OccasionEntity>>>());
        result as ApiSuccessResult<List<OccasionEntity>>;
        expect(result.data, expectedResult.occasions!
            .map((element) => element.toOccasOccasionEntity())
            .toList());
      },
    );

    test(
      'when getAllOccasions failed it should return an error result',
      () async {
        //Arrange
        var expectedError = "Server Error";
        when(
          mockedApiClient.getAllOccasions(),
        ).thenThrow(Exception(expectedError));

        //Call
        var result = await occasionRemoteDataSourceImpl.getAllOccasions();

        //Assert
        verify(mockedApiClient.getAllOccasions()).called(1);
        expect(result, isA<ApiErrorResult<List<OccasionEntity>>>());
        result as ApiErrorResult<List<OccasionEntity>>;
        expect(
          result.errorMessage, contains(expectedError)
        
        );
      },
    );
  });
}
