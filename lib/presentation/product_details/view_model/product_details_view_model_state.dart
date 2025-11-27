part of 'product_details_view_model_cubit.dart';

class ProductDetailsViewModelState extends Equatable {
  final BaseState<CartResponseEntity>? addToCartState;
  final int currentIndex;
  const ProductDetailsViewModelState({
    this.addToCartState,
    this.currentIndex = 0,
  });
  ProductDetailsViewModelState copyWith({
    BaseState<CartResponseEntity>? addToCartState,
    int? currentIndex,
  }) {
    return ProductDetailsViewModelState(
      addToCartState: addToCartState ?? this.addToCartState,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [addToCartState, currentIndex];
}
