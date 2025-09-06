// import 'package:elevate_ecommerce_app/api/data_source/home/home_data_source_impl.dart';
// import 'package:elevate_ecommerce_app/api/models/responses/home_response_dto/home_response_dto.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:elevate_ecommerce_app/api/client/api_client.dart';
// import 'package:elevate_ecommerce_app/domin/entities/home_entity.dart';
// import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
//
// /// --------- Mock Classes ---------
// class MockApiClient extends Mock implements ApiClient {}
//
// /// Fake HomeDto for testing
// class FakeHomeDto extends Fake implements HomeDto {
//   @override
//   HomeEntity toEntity() {
//     return HomeEntity(
//       categories: [],
//       bestSeller: [],
//       occasions: [],
//     );
//   }
// }
//
// void main() {
//   late MockApiClient mockApiClient;
//   late HomeRemoteDataSourceImpl dataSource;
//
//   setUp(() {
//     mockApiClient = MockApiClient();
//     dataSource = HomeRemoteDataSourceImpl(apiClient: mockApiClient);
//   });
//
//   group('HomeRemoteDataSourceImpl.getHome', () {
//     test('should return ApiSuccessResult when API call succeeds', () async {
//       // Arrange
//       final fakeDto = FakeHomeDto();
//       final fakeEntity = fakeDto.toEntity();
//
//       when(mockApiClient.getHome()).thenAnswer((_) async => fakeDto);
//
//       // Act
//       final result = await dataSource.getHome();
//
//       // Assert
//       expect(result, isA<ApiSuccessResult<HomeEntity>>());
//       expect((result as ApiSuccessResult<HomeEntity>).data, equals(fakeEntity));
//
//       verify(mockApiClient.getHome()).called(1);
//       verifyNoMoreInteractions(mockApiClient);
//     });
//
//     test('should return ApiErrorResult when API call throws', () async {
//       // Arrange
//       final exception = Exception('Network error');
//       when(mockApiClient.getHome()).thenThrow(exception);
//
//       // Act
//       final result = await dataSource.getHome();
//
//       // Assert
//       expect(result, isA<ApiErrorResult<HomeEntity>>());
//       expect((result as ApiErrorResult<HomeEntity>).error, equals(exception));
//
//       verify(mockApiClient.getHome()).called(1);
//       verifyNoMoreInteractions(mockApiClient);
//     });
//   });
// }
