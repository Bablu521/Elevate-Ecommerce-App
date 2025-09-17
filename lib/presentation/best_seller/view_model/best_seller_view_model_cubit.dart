import 'dart:async';

import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_product_to_cart_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_best_seller_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view_model/best_seller_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'best_seller_view_model_state.dart';

@injectable
class BestSellerViewModelCubit extends Cubit<BestSellerViewModelState> {
  BestSellerViewModelCubit(
    this._getBestSellerUseCase,
    this._addProductToCartUseCase,
  ) : super(const BestSellerViewModelState());
  late final StreamSubscription subscription;
  final GetBestSellerUseCase _getBestSellerUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;

  Future<void> doIntent(BestSellerEvent event) async {
    switch (event) {
      case GetBestSellerEvent():
        await _getBestSellerPro();
      case BestSellerAddToCartEvent():
        await _addToCart(event.productId);
    }
  }

  Future<void> _getBestSellerPro() async {
    emit(state.copyWith(stateBestSellerListProduct: BaseState.loading()));
    final result = await _getBestSellerUseCase.call();
    switch (result) {
      case ApiSuccessResult<List<BestSellerProductEntity>>():
        emit(
          state.copyWith(
            stateBestSellerListProduct: BaseState.success(result.data),
          ),
        );
      case ApiErrorResult<List<BestSellerProductEntity>>():
        emit(
          state.copyWith(
            stateBestSellerListProduct: BaseState.error(result.errorMessage),
          ),
        );
    }
  }

  Future<void> _addToCart(String? id) async {
    emit(
      state.copyWith(
        cartStates: {...state.cartStates, id: BaseState.loading()},
      ),
    );
    final result = await _addProductToCartUseCase.call(
      AddProductToCartRequestEntity(product: id, quantity: 1),
    );
    switch (result) {
      case ApiSuccessResult<CartResponseEntity>():
        emit(
          state.copyWith(
            cartStates: {
              ...state.cartStates,
              id: BaseState.success(result.data),
            },
          ),
        );
      case ApiErrorResult<CartResponseEntity>():
        emit(
          state.copyWith(
            cartStates: {
              ...state.cartStates,
              id: BaseState.error(result.errorMessage),
            },
          ),
        );
    }
  }
}
