part of 'search_view_model.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final List<ProductEntity>? productsList;
  final bool isProductsEmpty;
  final String? errorMessage;
  final Map<String?, BaseState> cartStates;

  const SearchState({
    this.isLoading = false,
    this.productsList,
    this.isProductsEmpty = false,
    this.errorMessage,
    this.cartStates = const {},
  });

  SearchState copyWith({
    bool? isLoading,
    List<ProductEntity>? productsList,
    bool? isProductsEmpty,
    String? errorMessage,
    Map<String?, BaseState>? cartStates,
  }) {
    return SearchState(
      isLoading: isLoading ?? false,
      productsList: productsList ?? this.productsList,
      isProductsEmpty: isProductsEmpty ?? false,
      errorMessage: errorMessage,
      cartStates: cartStates ?? this.cartStates,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    productsList,
    isProductsEmpty,
    errorMessage,
    cartStates,
  ];
}
