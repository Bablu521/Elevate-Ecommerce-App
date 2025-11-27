import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_address_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_logged_user_addresses_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/load_all_cities_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/load_areas_related_to_city_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/remove_address_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/update_address_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_events.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
@injectable
class AddressViewModel extends Cubit<AddressStates> {
  final GetLoggedUserAddressesUseCase _getLoggedUserAddressesUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;
  final RemoveAddressUseCase _removeAddressUseCase;
  final LoadAllCitiesUseCase _loadAllCitiesUseCase;
  final LoadAreasRelatedToCityUseCase _loadAreasRelatedToCityUseCase;

  AddressViewModel(
    this._getLoggedUserAddressesUseCase,
    this._addAddressUseCase,
    this._updateAddressUseCase,
    this._removeAddressUseCase,
    this._loadAllCitiesUseCase,
    this._loadAreasRelatedToCityUseCase,
  ) : super(const AddressStates());

  final ValueNotifier<List<CityEntity>> cities = ValueNotifier([]);
  final ValueNotifier<List<AreaEntity>> areas = ValueNotifier([]);
  final ValueNotifier<String?> selectedCityId = ValueNotifier(null);
  final ValueNotifier<String?> selectedAreaId = ValueNotifier(null);
  TextEditingController addressContoller = TextEditingController();
  TextEditingController phoneNumberContoller = TextEditingController();
  TextEditingController recipientNameContoller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedCity;
  double? selectedLat;
  double? selectedLng;

  void doIntent(AddressEvents event) {
    switch (event) {
      case OnLoadLoggedUserAddressesEvent():
        _getLoggedUserAddresses();
        break;
      case OnRemoveAddressEvent():
        _removeAddress(event.addressId);
        break;
      case OnAddAddressEvent():
        _addAddress();
        break;
      case OnUpdateAddressEvent():
        _updateAddress(event.addressId);
        break;
    }
  }

  Future<void> loadAllCities() async {
    final data = await _loadAllCitiesUseCase.call();
    cities.value = data;
  }

  Future<void> loadAreasRelatedToCity(String cityId) async {
    areas.value = [];
    final data = await _loadAreasRelatedToCityUseCase.call(cityId);
    areas.value = data;
  }

  Future<void> onCitySelected(String cityId) async {
    selectedCityId.value = cityId;
    await loadAreasRelatedToCity(cityId);
  }

  void onAreaSelected(String areaId) {
    if (areas.value.any((a) => a.id == areaId)) {
      selectedAreaId.value = areaId;
    } else {
      selectedAreaId.value = null;
    }
  }

  String? getValidCityId() {
    final currentCityId = selectedCityId.value;
    return cities.value.any((c) => c.id == currentCityId)
        ? currentCityId
        : null;
  }

  String? getValidAreaId() {
    final currentAreaId = selectedAreaId.value;
    return areas.value.any((a) => a.id == currentAreaId) ? currentAreaId : null;
  }

  Future<void> _getLoggedUserAddresses() async {
    emit(state.copyWith(addressListIsLoading: true));
    final result = await _getLoggedUserAddressesUseCase.call();
    switch (result) {
      case ApiSuccessResult<List<AddressEntity>>():
        emit(
          state.copyWith(
            addressListIsLoading: false,
            addressListSuccess: result.data,
          ),
        );
      case ApiErrorResult<List<AddressEntity>>():
        emit(
          state.copyWith(
            addressListIsLoading: false,
            addressListErrorMessage: result.errorMessage,
          ),
        );
    }
  }

  Future<void> _addAddress() async {
    emit(state.copyWith(addressListIsLoading: true));
    final result = await _addAddressUseCase.call(
      AddressRequestEntity(
        street: addressContoller.text,
        phone: phoneNumberContoller.text,
        username: recipientNameContoller.text,
        city: selectedCity,
        lat: selectedLat.toString(),
        long: selectedLng.toString(),
      ),
    );
    switch (result) {
      case ApiSuccessResult<List<AddressEntity>>():
        emit(
          state.copyWith(
            addressListIsLoading: false,
            addressListSuccess: result.data,
            addressAdded: true
          ),
        );
      case ApiErrorResult<List<AddressEntity>>():
        emit(
          state.copyWith(
            addressListIsLoading: false,
            addressListErrorMessage: result.errorMessage,
          ),
        );
    }
  }

  Future<void> _updateAddress(String addressId) async {
    emit(state.copyWith(addressListIsLoading: true));
    final result = await _updateAddressUseCase.call(
      AddressRequestEntity(
        street: addressContoller.text,
        phone: phoneNumberContoller.text,
        username: recipientNameContoller.text,
        city: selectedCity,
        lat: selectedLat.toString(),
        long: selectedLng.toString(),
      ),
      addressId,
    );
    switch (result) {
      case ApiSuccessResult<List<AddressEntity>>():
        emit(
          state.copyWith(
            addressListIsLoading: false,
            addressListSuccess: result.data,
            addressUpdated: true
          ),
        );
      case ApiErrorResult<List<AddressEntity>>():
        emit(
          state.copyWith(
            addressListIsLoading: false,
            addressListErrorMessage: result.errorMessage,
          ),
        );
    }
  }

  Future<void> _removeAddress(String addressId) async {
    final result = await _removeAddressUseCase.call(addressId);
    switch (result) {
      case ApiSuccessResult<List<AddressEntity>>():
        emit(state.copyWith(addressListSuccess: result.data));
      case ApiErrorResult<List<AddressEntity>>():
        emit(state.copyWith(addressListErrorMessage: result.errorMessage));
    }
  }

  @override
  Future<void> close() {
    addressContoller.dispose();
    phoneNumberContoller.dispose();
    recipientNameContoller.dispose();
    cities.dispose();
    areas.dispose();
    selectedCityId.dispose();
    selectedAreaId.dispose();
    return super.close();
  }
}
