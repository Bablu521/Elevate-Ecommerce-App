import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:equatable/equatable.dart';

class CartStates extends Equatable {
  final bool cartDataLoading;
  final CartResponseEntity? cartDataSuccess;
  final String? cartDataErrorMessage;
  final bool navigateToLoginScreen;
  final bool cartIsEmpty;

  const CartStates({
    this.cartDataLoading = false,
    this.cartDataSuccess,
    this.cartDataErrorMessage,
    this.navigateToLoginScreen = false,
    this.cartIsEmpty = false
  });

  CartStates copyWith({
    bool? cartDataLoading,
    CartResponseEntity? cartDataSuccess,
    String? cartDataErrorMessage,
    bool? navigateToLoginScreen,
    bool? cartIsEmpty
  }) {
    return CartStates(
      cartDataLoading: cartDataLoading ?? this.cartDataLoading,
      cartDataSuccess: cartDataSuccess,
      cartDataErrorMessage: cartDataErrorMessage,
      navigateToLoginScreen:
          navigateToLoginScreen ?? this.navigateToLoginScreen,
          cartIsEmpty: cartIsEmpty ?? this.cartIsEmpty
    );
  }

  @override
  List<Object?> get props => [
    cartDataLoading,
    cartDataSuccess,
    cartDataErrorMessage,
    navigateToLoginScreen,
  ];
}
