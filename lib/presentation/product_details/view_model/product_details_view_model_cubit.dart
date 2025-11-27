import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_product_to_cart_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/view_model/product_details_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_details_view_model_state.dart';

@injectable
class ProductDetailsViewModelCubit extends Cubit<ProductDetailsViewModelState> {
  ProductDetailsViewModelCubit(this._addProductToCartUseCase)
    : super(const ProductDetailsViewModelState());
  final AddProductToCartUseCase _addProductToCartUseCase;
  Future<void> doIntent(ProductDetailsEvent event) async {
    switch (event) {
      case ProductDetailsAddToCartEvent():
        await _addToCart(event.request);
        break;
      case ProductDetailsUpdateImageCover():
        _initialUI(event.currentIndex);
        break;
    }
  }

  Future<void> _addToCart(AddProductToCartRequestEntity request) async {
    emit(state.copyWith(addToCartState: BaseState.loading()));
    final response = await _addProductToCartUseCase.call(request);
    switch (response) {
      case ApiSuccessResult<CartResponseEntity>():
        emit(state.copyWith(addToCartState: BaseState.success(response.data)));
      case ApiErrorResult<CartResponseEntity>():
        emit(
          state.copyWith(
            addToCartState: BaseState.error(response.errorMessage),
          ),
        );
    }
  }

  void _initialUI(int currentIndex) {
    emit(state.copyWith(currentIndex: currentIndex, addToCartState: null));
  }
}
