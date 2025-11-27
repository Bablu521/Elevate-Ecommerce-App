part of 'checkout_view_model.dart';

class CheckoutState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<AddressEntity>? addressesList;
  final int subTotal;
  final int total;
  final bool isSuccessCashOrder;
  final bool isSuccessCreditOrder;

  const CheckoutState({
    this.isLoading = false,
    this.errorMessage,
    this.addressesList,
    this.subTotal = 0,
    this.total = 0,
    this.isSuccessCashOrder = false,
    this.isSuccessCreditOrder = false,
  });

  CheckoutState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<AddressEntity>? addressesList,
    int? subTotal,
    int? total,
    bool? isSuccessCashOrder,
    bool? isSuccessCreditOrder,
  }) {
    return CheckoutState(
      isLoading: isLoading ?? false,
      errorMessage: errorMessage,
      addressesList: addressesList ?? this.addressesList,
      subTotal: subTotal ?? this.subTotal,
      total: total ?? this.total,
      isSuccessCashOrder: isSuccessCashOrder ?? false,
      isSuccessCreditOrder: isSuccessCreditOrder ?? false,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    addressesList,
    subTotal,
    total,
    isSuccessCashOrder,
    isSuccessCreditOrder,
  ];
}
