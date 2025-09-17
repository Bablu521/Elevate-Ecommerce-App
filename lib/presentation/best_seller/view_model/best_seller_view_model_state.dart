part of 'best_seller_view_model_cubit.dart';

class BestSellerViewModelState extends Equatable {
  final BaseState<List<BestSellerProductEntity>>? stateBestSellerListProduct;
  final Map<String?, BaseState> cartStates;
  const BestSellerViewModelState({
    this.stateBestSellerListProduct,
    this.cartStates = const {},
  });
  BestSellerViewModelState copyWith({
    BaseState<List<BestSellerProductEntity>>? stateBestSellerListProduct,
    BaseState<CartResponseEntity>? stateAddToCart,
    Map<String?, BaseState>? cartStates,
  }) {
    return BestSellerViewModelState(
      stateBestSellerListProduct:
          stateBestSellerListProduct ?? this.stateBestSellerListProduct,
      cartStates: cartStates ?? this.cartStates,
    );
  }

  @override
  List<Object?> get props => [stateBestSellerListProduct, cartStates];
}
