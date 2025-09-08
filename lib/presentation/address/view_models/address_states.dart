import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:equatable/equatable.dart';

class AddressStates extends Equatable {
  final bool addressListIsLoading;
  final List<AddressEntity> addressListSuccess;
  final String? addressListErrorMessage;

  const AddressStates({
    this.addressListIsLoading = false,
    this.addressListSuccess = const [],
    this.addressListErrorMessage,
  });

  AddressStates copyWith({
    bool? addressListIsLoading,
    List<AddressEntity>? addressListSuccess,
    String? addressListErrorMessage,
  }) {
    return AddressStates(
      addressListIsLoading: addressListIsLoading ?? this.addressListIsLoading,
      addressListSuccess: addressListSuccess ?? this.addressListSuccess,
      addressListErrorMessage: addressListErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    addressListIsLoading,
    addressListSuccess,
    addressListErrorMessage,
  ];
}
