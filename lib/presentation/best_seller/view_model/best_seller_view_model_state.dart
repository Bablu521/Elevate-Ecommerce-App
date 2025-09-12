part of 'best_seller_view_model_cubit.dart';

class BestSellerViewModelState extends Equatable {
  final BaseState<List<BestSellerProductEntity>>? stateBestSellerListProduct;
  const BestSellerViewModelState({this.stateBestSellerListProduct});
  BestSellerViewModelState copyWith({
    BaseState<List<BestSellerProductEntity>>? stateBestSellerListProduct,
  }) {
    return BestSellerViewModelState(
      stateBestSellerListProduct:
          stateBestSellerListProduct ?? this.stateBestSellerListProduct,
    );
  }

  @override
  List<Object?> get props => [stateBestSellerListProduct];
}
