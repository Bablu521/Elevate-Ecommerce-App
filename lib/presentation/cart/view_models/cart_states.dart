import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:equatable/equatable.dart';

class CartStates extends Equatable {
  final bool cartDataLoading;
  final CartResponseEntity? cartDataSuccess;
  final String? cartDataErrorMessage;

  const CartStates({
    this.cartDataLoading = false,
    this.cartDataSuccess,
    this.cartDataErrorMessage,
  });

  CartStates copyWith({
    bool? cartDataLoading,
    CartResponseEntity? cartDataSuccess,
    String? cartDataErrorMessage
  }) {
    return CartStates(
      cartDataLoading: cartDataLoading ?? this.cartDataLoading,
      cartDataSuccess: cartDataSuccess,
      cartDataErrorMessage: cartDataErrorMessage
    );
  }

  @override
  List<Object?> get props => [
    cartDataLoading,
    cartDataSuccess,
    cartDataErrorMessage,
  ];
}
