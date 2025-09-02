import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_product_to_cart_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/clear_user_cart_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/delete_specific_cart_item_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_logged_user_cart_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/cart/view_models/cart_events.dart';
import 'package:elevate_ecommerce_app/presentation/cart/view_models/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  final GetLoggedUserCartUseCase _getLoggedUserCartUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;
  final DeleteSpecificCartItemUseCase _deleteSpecificCartItemUseCase;
  final ClearUserCartUseCase _clearUserCartUseCase;
  CartViewModel(
    this._getLoggedUserCartUseCase,
    this._addProductToCartUseCase,
    this._deleteSpecificCartItemUseCase,
    this._clearUserCartUseCase,
  ) : super(const CartStates());

  void doIntent(CartEvents event) {
    switch (event) {
      case OnLoadLoggedUserCartDataEvent():
        _getLoggedUserCart();
        break;

      case OnDeleteSpecificCartItemEvent():
        _deleteSpecificCartItem(event.productId);
        break;

      case OnIncrementProductToCartEvent():
        _addProductToCart(event.addProductToCartRequestEntity);
        break;

      case OnDecrementProductFromCartEvent():
        _addProductToCart(event.addProductToCartRequestEntity);
        break;

      case OnClearUserCartEvent():
        _clearUserCart();
        break;
    }
  }

  Future<void> _getLoggedUserCart() async {
    emit(state.copyWith(cartDataLoading: true));
    final result = await _getLoggedUserCartUseCase.call();
    switch (result) {
      case ApiSuccessResult<CartResponseEntity>():
        emit(
          state.copyWith(cartDataLoading: false, cartDataSuccess: result.data),
        );
      case ApiErrorResult<CartResponseEntity>():
        emit(
          state.copyWith(
            cartDataLoading: false,
            cartDataErrorMessage: result.errorMessage,
          ),
        );
    }
  }

  Future<void> _deleteSpecificCartItem(String productId) async {
    final result = await _deleteSpecificCartItemUseCase.call(productId);
    switch (result) {
      case ApiSuccessResult<CartResponseEntity>():
        emit(state.copyWith(cartDataSuccess: result.data));
      case ApiErrorResult<CartResponseEntity>():
        emit(state.copyWith(cartDataErrorMessage: result.errorMessage));
    }
  }

  Future<void> _addProductToCart(
    AddProductToCartRequestEntity addProductToCartRequestEntity,
  ) async {
    final result = await _addProductToCartUseCase.call(
      addProductToCartRequestEntity,
    );
    switch (result) {
      case ApiSuccessResult<CartResponseEntity>():
        emit(state.copyWith(cartDataSuccess: result.data));
      case ApiErrorResult<CartResponseEntity>():
        emit(state.copyWith(cartDataErrorMessage: result.errorMessage));
    }
  }

  Future<void> _clearUserCart() async {
    final result = await _clearUserCartUseCase.call();
    switch (result) {
      case ApiSuccessResult<CartResponseEntity>():
        emit(state.copyWith(cartDataSuccess: result.data));
      case ApiErrorResult<CartResponseEntity>():
        emit(state.copyWith(cartDataErrorMessage: result.errorMessage));
    }
  }
}
