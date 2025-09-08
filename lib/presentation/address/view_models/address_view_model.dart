import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_address_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_logged_user_addresses_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/remove_address_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/update_address_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_events.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressViewModel extends Cubit<AddressStates> {
  final GetLoggedUserAddressesUseCase _getLoggedUserAddressesUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;
  final RemoveAddressUseCase _removeAddressUseCase;
  AddressViewModel(
    this._getLoggedUserAddressesUseCase,
    this._addAddressUseCase,
    this._updateAddressUseCase,
    this._removeAddressUseCase,
  ) : super(const AddressStates());

  

  void doIntent(AddressEvents event) {
    switch (event) {
      case OnLoadLoggedUserAddressesEvent():
        _getLoggedUserAddresses();
        break;
      case OnRemoveAddressEvent():
        _removeAddress(event.addressId);
        break;
    }
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

  Future<void> _removeAddress(String addressId) async {
    final result = await _removeAddressUseCase.call(addressId);
    switch (result) {
      case ApiSuccessResult<List<AddressEntity>>():
        emit(state.copyWith(addressListSuccess: result.data));
      case ApiErrorResult<List<AddressEntity>>():
        emit(state.copyWith(addressListErrorMessage: result.errorMessage));
    }
  }
}
