import 'package:bloc/bloc.dart';
import 'package:elevate_ecommerce_app/presentation/search/view_models/search_events.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api_result/api_result.dart';
import '../../../core/base_state/base_state.dart';
import '../../../domin/entities/cart_response_entity/cart_response_entity.dart';
import '../../../domin/entities/product_entity.dart';
import '../../../domin/entities/requests/add_product_to_cart_request_entity.dart';
import '../../../domin/use_cases/add_product_to_cart_use_case.dart';
import '../../../domin/use_cases/get_all_products_use_case.dart';

part 'search_state.dart';

@injectable
class SearchViewModel extends Cubit<SearchState> {
  final GetAllProductsUseCase _getAllProductsUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;

  SearchViewModel(this._getAllProductsUseCase, this._addProductToCartUseCase)
    : super(const SearchState());

  TextEditingController searchController = TextEditingController();

  void doIntent(SearchEvents events) {
    switch (events) {
      case ProductsSearchEvent():
        _productsSearch();
      case SearchAddToCartEvent():
        _addToCart(events.productId);
      case ClearProductsSearchEvent():
        _clearProductsSearch();
    }
  }

  Future<void> _productsSearch() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllProductsUseCase(search: searchController.text);
    switch (result) {
      case ApiSuccessResult<List<ProductEntity>>():
        if (result.data.isEmpty) {
          emit(state.copyWith(isProductsEmpty: true));
        }else {
          emit(state.copyWith(productsList: result.data));
        }
      case ApiErrorResult<List<ProductEntity>>():
        emit(state.copyWith(errorMessage: result.errorMessage));
    }
  }

  void _clearProductsSearch() {
    searchController.text = "";
    emit(state.copyWith(productsList: []));
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
