import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:equatable/equatable.dart';

class AddressStates extends Equatable {
  final bool addressListIsLoading;
  final List<AddressEntity> addressListSuccess;
  final String? addressListErrorMessage;
  final bool addressAdded;
  final bool addressUpdated;

  const AddressStates({
    this.addressListIsLoading = false,
    this.addressListSuccess = const [],
    this.addressListErrorMessage,
    this.addressAdded = false,
    this.addressUpdated = false
  });

  AddressStates copyWith({
    bool? addressListIsLoading,
    List<AddressEntity>? addressListSuccess,
    String? addressListErrorMessage,
    bool? addressAdded,
    bool? addressUpdated,
  }) {
    return AddressStates(
      addressListIsLoading: addressListIsLoading ?? this.addressListIsLoading,
      addressListSuccess: addressListSuccess ?? this.addressListSuccess,
      addressListErrorMessage: addressListErrorMessage,
      addressAdded: addressAdded ?? this.addressAdded,
      addressUpdated: addressUpdated ?? this.addressUpdated
    );
  }

  @override
  List<Object?> get props => [
    addressListIsLoading,
    addressListSuccess,
    addressListErrorMessage,
    addressAdded,
    addressUpdated
  ];
}
