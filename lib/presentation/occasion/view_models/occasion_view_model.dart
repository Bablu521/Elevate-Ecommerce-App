import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_product_to_cart_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_products_by_occasion_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/occasion_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_events.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionViewModel extends Cubit<OccasionStates> {
  final OccasionUseCase _occasionUseCase;
  final GetProductsByOccasionUseCase _getProductsByOccasionUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;

  OccasionViewModel(
    this._occasionUseCase,
    this._getProductsByOccasionUseCase,
    this._addProductToCartUseCase,
  ) : super(const OccasionStates());

  void doIntent(OccasionEvent event) {
    switch (event) {
      case OnLoadOccasionListEvent():
        _getAllOccasions();
      case OnLoadProductListEvent(occasionId: final occasionId):
        _getProductsByOccasion(occasionId);
      case OccasionAddToCartEvent():
        _addToCart(event.productId);
    }
  }

  late List<OccasionEntity> occasionListSuccess = [];

  Future<void> _getAllOccasions() async {
    emit(state.copyWith(occasionListIsLoading: true));
    final result = await _occasionUseCase.call();
    switch (result) {
      case ApiSuccessResult<List<OccasionEntity>>():
        emit(
          state.copyWith(
            occasionListIsLoading: false,
            occasionListSuccess: result.data,
          ),
        );
      case ApiErrorResult<List<OccasionEntity>>():
        emit(
          state.copyWith(
            occasionListIsLoading: false,
            occasionListErrorMessage: result.errorMessage,
          ),
        );
    }
  }

  Future<void> _getProductsByOccasion(String occasionId) async {
    emit(state.copyWith(productListIsLoading: true));
    final result = await _getProductsByOccasionUseCase(occasionId);
    switch (result) {
      case ApiSuccessResult<List<ProductEntity>>():
        emit(
          state.copyWith(
            productListIsLoading: false,
            productListSuccess: result.data,
          ),
        );
      case ApiErrorResult<List<ProductEntity>>():
        emit(
          state.copyWith(
            productListIsLoading: false,
            productListErrorMessage: result.errorMessage,
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
