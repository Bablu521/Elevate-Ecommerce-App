import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_events.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_states.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/load_areas_related_to_city_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_address_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_logged_user_addresses_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/load_all_cities_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/remove_address_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/update_address_use_case.dart';

import 'address_view_model_test.mocks.dart';

@GenerateMocks([
  GetLoggedUserAddressesUseCase,
  AddAddressUseCase,
  UpdateAddressUseCase,
  RemoveAddressUseCase,
  LoadAllCitiesUseCase,
  LoadAreasRelatedToCityUseCase,
])
void main() {
  late AddressViewModel viewModel;
  late MockGetLoggedUserAddressesUseCase mockGetLoggedUserAddressesUseCase;
  late MockAddAddressUseCase mockAddAddressUseCase;
  late MockUpdateAddressUseCase mockUpdateAddressUseCase;
  late MockRemoveAddressUseCase mockRemoveAddressUseCase;
  late MockLoadAllCitiesUseCase mockLoadAllCitiesUseCase;
  late MockLoadAreasRelatedToCityUseCase mockLoadAreasRelatedToCityUseCase;
  const AddressStates state = AddressStates();
  late ApiResult<List<AddressEntity>> expectedResult;
  late ApiResult<List<AddressEntity>> expectedFailure;
  late List<AddressEntity> expectedAddressEntity;
  const expectedError = "Server Error";
  const addressId = "fake-Id";
  late AddressRequestEntity addressRequestEntity;

  setUp(() {
    mockGetLoggedUserAddressesUseCase = MockGetLoggedUserAddressesUseCase();
    mockAddAddressUseCase = MockAddAddressUseCase();
    mockUpdateAddressUseCase = MockUpdateAddressUseCase();
    mockRemoveAddressUseCase = MockRemoveAddressUseCase();
    mockLoadAllCitiesUseCase = MockLoadAllCitiesUseCase();
    mockLoadAreasRelatedToCityUseCase = MockLoadAreasRelatedToCityUseCase();

    viewModel = AddressViewModel(
      mockGetLoggedUserAddressesUseCase,
      mockAddAddressUseCase,
      mockUpdateAddressUseCase,
      mockRemoveAddressUseCase,
      mockLoadAllCitiesUseCase,
      mockLoadAreasRelatedToCityUseCase,
    );

    expectedAddressEntity = [
      const AddressEntity(
        street: "fake",
        phone: "fake",
        username: "fake",
        city: "fake",
        lat: "fake",
        long: "1.0",
        id: "1.0",
      ),
    ];

    addressRequestEntity = const AddressRequestEntity(
      street: "fake",
      phone: "fake",
      username: "fake",
      city: "fake",
      lat: "1.0",
      long: "1.0",
    );

    expectedResult = ApiSuccessResult(expectedAddressEntity);
    provideDummy<ApiResult<List<AddressEntity>>>(expectedResult);
    expectedFailure = ApiErrorResult(expectedError);
    provideDummy<ApiResult<List<AddressEntity>>>(expectedFailure);
  });

  group('loadAllCities', () {
    final mockCities = [
      const CityEntity(id: '1', nameEn: 'Cairo', nameAr: 'القاهرة'),
      const CityEntity(id: '2', nameEn: 'Alexandria', nameAr: 'الإسكندرية'),
    ];

    test('should load cities and update cities ValueNotifier', () async {
      // Arrange
      when(mockLoadAllCitiesUseCase.call()).thenAnswer((_) async => mockCities);

      // Act
      await viewModel.loadAllCities();

      // Assert
      expect(viewModel.cities.value, equals(mockCities));
      verify(mockLoadAllCitiesUseCase.call()).called(1);
    });
  });

  group('loadAreasRelatedToCity', () {
    final mockAreas = [
      const AreaEntity(
        id: '1',
        cityId: '1',
        nameEn: 'Downtown',
        nameAr: 'وسط البلد',
      ),
      const AreaEntity(
        id: '2',
        cityId: '1',
        nameEn: 'Maadi',
        nameAr: 'المعادي',
      ),
    ];

    test(
      'should load areas for a city and update areas ValueNotifier',
      () async {
        // Arrange
        const cityId = '1';
        when(
          mockLoadAreasRelatedToCityUseCase.call(cityId),
        ).thenAnswer((_) async => mockAreas);

        // Act
        await viewModel.loadAreasRelatedToCity(cityId);

        // Assert
        expect(viewModel.areas.value, equals(mockAreas));
        verify(mockLoadAreasRelatedToCityUseCase.call(cityId)).called(1);
      },
    );

    test('should clear areas before loading new ones', () async {
      // Arrange
      const cityId = '1';
      viewModel.areas.value = [
        const AreaEntity(
          id: 'old',
          cityId: 'old',
          nameEn: 'Old',
          nameAr: 'قديم',
        ),
      ];
      when(
        mockLoadAreasRelatedToCityUseCase.call(cityId),
      ).thenAnswer((_) async => mockAreas);

      // Act
      await viewModel.loadAreasRelatedToCity(cityId);

      // Assert
      expect(viewModel.areas.value, equals(mockAreas));
      verify(mockLoadAreasRelatedToCityUseCase.call(cityId)).called(1);
    });
  });

  group('onCitySelected', () {
    final mockAreas = [
      const AreaEntity(
        id: '1',
        cityId: '1',
        nameEn: 'Downtown',
        nameAr: 'وسط البلد',
      ),
    ];

    test('should update selectedCityId and load areas', () async {
      // Arrange
      const cityId = '1';
      when(
        mockLoadAreasRelatedToCityUseCase.call(cityId),
      ).thenAnswer((_) async => mockAreas);

      // Act
      await viewModel.onCitySelected(cityId);

      // Assert
      expect(viewModel.selectedCityId.value, cityId);
      expect(viewModel.areas.value, mockAreas);
      verify(mockLoadAreasRelatedToCityUseCase.call(cityId)).called(1);
    });
  });

  group('onAreaSelected', () {
    test('should update selectedAreaId when area exists', () {
      // Arrange
      const areaId = '1';
      viewModel.areas.value = [
        const AreaEntity(
          id: '1',
          cityId: '1',
          nameEn: 'Downtown',
          nameAr: 'وسط البلد',
        ),
      ];

      // Act
      viewModel.onAreaSelected(areaId);

      // Assert
      expect(viewModel.selectedAreaId.value, areaId);
    });

    test('should set selectedAreaId to null when area does not exist', () {
      // Arrange
      const areaId = 'invalid';
      viewModel.areas.value = [
        const AreaEntity(
          id: '1',
          cityId: '1',
          nameEn: 'Downtown',
          nameAr: 'وسط البلد',
        ),
      ];

      // Act
      viewModel.onAreaSelected(areaId);

      // Assert
      expect(viewModel.selectedAreaId.value, isNull);
    });
  });

  group('getValidCityId', () {
    test('should return cityId if it exists in cities', () {
      // Arrange
      viewModel.cities.value = [
        const CityEntity(id: '1', nameEn: 'Cairo', nameAr: 'القاهرة'),
      ];
      viewModel.selectedCityId.value = '1';

      // Act
      final result = viewModel.getValidCityId();

      // Assert
      expect(result, '1');
    });

    test('should return null if cityId does not exist', () {
      // Arrange
      viewModel.cities.value = [
        const CityEntity(id: '1', nameEn: 'Cairo', nameAr: 'القاهرة'),
      ];
      viewModel.selectedCityId.value = 'invalid';

      // Act
      final result = viewModel.getValidCityId();

      // Assert
      expect(result, isNull);
    });
  });

  group('getValidAreaId', () {
    test('should return areaId if it exists in areas', () {
      // Arrange
      viewModel.areas.value = [
        const AreaEntity(
          id: '1',
          cityId: '1',
          nameEn: 'Downtown',
          nameAr: 'وسط البلد',
        ),
      ];
      viewModel.selectedAreaId.value = '1';

      // Act
      final result = viewModel.getValidAreaId();

      // Assert
      expect(result, '1');
    });

    test('should return null if areaId does not exist', () {
      // Arrange
      viewModel.areas.value = [
        const AreaEntity(
          id: '1',
          cityId: '1',
          nameEn: 'Downtown',
          nameAr: 'وسط البلد',
        ),
      ];
      viewModel.selectedAreaId.value = 'invalid';

      // Act
      final result = viewModel.getValidAreaId();

      // Assert
      expect(result, isNull);
    });
  });

  blocTest<AddressViewModel, AddressStates>(
    'call doIntent with OnLoadLoggedUserAddressesEvent then load and successed',
    build: () => viewModel,
    act: (viewModel) async {
      when(
        mockGetLoggedUserAddressesUseCase.call(),
      ).thenAnswer((_) async => expectedResult);
      return viewModel.doIntent(OnLoadLoggedUserAddressesEvent());
    },
    expect: () => [
      state.copyWith(addressListIsLoading: true),
      state.copyWith(
        addressListIsLoading: false,
        addressListSuccess: expectedAddressEntity,
      ),
    ],
    verify: (_) {
      verify(mockGetLoggedUserAddressesUseCase.call()).called(1);
    },
  );

  blocTest<AddressViewModel, AddressStates>(
    'call doIntent with OnLoadLoggedUserAddressesEvent then failed',
    build: () => viewModel,
    act: (viewModel) async {
      when(
        mockGetLoggedUserAddressesUseCase.call(),
      ).thenAnswer((_) async => expectedFailure);
      return viewModel.doIntent(OnLoadLoggedUserAddressesEvent());
    },
    expect: () => [
      state.copyWith(addressListIsLoading: true),
      state.copyWith(
        addressListIsLoading: false,
        addressListErrorMessage: expectedError,
      ),
    ],
    verify: (_) {
      verify(mockGetLoggedUserAddressesUseCase.call()).called(1);
    },
  );

  blocTest<AddressViewModel, AddressStates>(
    'call doIntent with OnAddAddressEvent then load and successed',
    build: () => viewModel,
    act: (viewModel) async {
      when(
        mockAddAddressUseCase.call(addressRequestEntity),
      ).thenAnswer((_) async => expectedResult);
      viewModel.addressContoller.text = "fake";
      viewModel.phoneNumberContoller.text = "fake";
      viewModel.recipientNameContoller.text = "fake";
      viewModel.selectedCity = "fake";
      viewModel.selectedLat = 1.0;
      viewModel.selectedLng = 1.0;
      return viewModel.doIntent(OnAddAddressEvent());
    },
    expect: () => [
      state.copyWith(addressListIsLoading: true),
      state.copyWith(
        addressListIsLoading: false,
        addressListSuccess: expectedAddressEntity,
        addressAdded: true
      ),
    ],
    verify: (_) {
      verify(mockAddAddressUseCase.call(addressRequestEntity)).called(1);
    },
  );

  blocTest<AddressViewModel, AddressStates>(
    'call doIntent with OnAddAddressEvent then failed',
    build: () => viewModel,
    act: (viewModel) async {
      when(
        mockAddAddressUseCase.call(addressRequestEntity),
      ).thenAnswer((_) async => expectedFailure);
      viewModel.addressContoller.text = "fake";
      viewModel.phoneNumberContoller.text = "fake";
      viewModel.recipientNameContoller.text = "fake";
      viewModel.selectedCity = "fake";
      viewModel.selectedLat = 1.0;
      viewModel.selectedLng = 1.0;
      return viewModel.doIntent(OnAddAddressEvent());
    },
    expect: () => [
      state.copyWith(addressListIsLoading: true),
      state.copyWith(
        addressListIsLoading: false,
        addressListErrorMessage: expectedError,
      ),
    ],
    verify: (_) {
      verify(mockAddAddressUseCase.call(addressRequestEntity)).called(1);
    },
  );

  blocTest<AddressViewModel, AddressStates>(
    'call doIntent with OnUpdateAddressEvent then load and successed',
    build: () => viewModel,
    act: (viewModel) async {
      when(
        mockUpdateAddressUseCase.call(addressRequestEntity, addressId),
      ).thenAnswer((_) async => expectedResult);
      viewModel.addressContoller.text = "fake";
      viewModel.phoneNumberContoller.text = "fake";
      viewModel.recipientNameContoller.text = "fake";
      viewModel.selectedCity = "fake";
      viewModel.selectedLat = 1.0;
      viewModel.selectedLng = 1.0;
      return viewModel.doIntent(OnUpdateAddressEvent(addressId: addressId));
    },
    expect: () => [
      state.copyWith(addressListIsLoading: true),
      state.copyWith(
        addressListIsLoading: false,
        addressListSuccess: expectedAddressEntity,
        addressUpdated: true
      ),
    ],
    verify: (_) {
      verify(mockUpdateAddressUseCase.call(addressRequestEntity, addressId)).called(1);
    },
  );

  blocTest<AddressViewModel, AddressStates>(
    'call doIntent with OnUpdateAddressEvent then failed',
    build: () => viewModel,
    act: (viewModel) async {
      when(
        mockUpdateAddressUseCase.call(addressRequestEntity, addressId),
      ).thenAnswer((_) async => expectedFailure);
      viewModel.addressContoller.text = "fake";
      viewModel.phoneNumberContoller.text = "fake";
      viewModel.recipientNameContoller.text = "fake";
      viewModel.selectedCity = "fake";
      viewModel.selectedLat = 1.0;
      viewModel.selectedLng = 1.0;
      return viewModel.doIntent(OnUpdateAddressEvent(addressId: addressId));
    },
    expect: () => [
      state.copyWith(addressListIsLoading: true),
      state.copyWith(
        addressListIsLoading: false,
        addressListErrorMessage: expectedError,
      ),
    ],
    verify: (_) {
      verify(mockUpdateAddressUseCase.call(addressRequestEntity, addressId)).called(1);
    },
  );

  blocTest<AddressViewModel, AddressStates>(
    'call doIntent with OnRemoveAddressEvent then successed',
    build: () => viewModel,
    act: (viewModel) async {
      when(
        mockRemoveAddressUseCase.call(addressId),
      ).thenAnswer((_) async => expectedResult);
      return viewModel.doIntent(OnRemoveAddressEvent(addressId: addressId));
    },
    expect: () => [
      state.copyWith(
        addressListSuccess: expectedAddressEntity,
      ),
    ],
    verify: (_) {
      verify(mockRemoveAddressUseCase.call(addressId)).called(1);
    },
  );

  blocTest<AddressViewModel, AddressStates>(
    'call doIntent with OnRemoveAddressEvent then failed',
    build: () => viewModel,
    act: (viewModel) async {
      when(
        mockRemoveAddressUseCase.call(addressId),
      ).thenAnswer((_) async => expectedFailure);
      return viewModel.doIntent(OnRemoveAddressEvent(addressId: addressId));
    },
    expect: () => [
      state.copyWith(
        addressListErrorMessage: expectedError,
      ),
    ],
    verify: (_) {
      verify(mockRemoveAddressUseCase.call(addressId)).called(1);
    },
  );
}
