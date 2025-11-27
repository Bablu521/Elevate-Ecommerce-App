part of 'categories_view_model.dart';

class CategoriesState extends Equatable {
  final bool isLoading;
  final bool isProductsLoading;
  final List<CategoryEntity>? categoriesList;
  final List<ProductEntity>? productsList;
  final String? errorMessage;
  final Map<String?, BaseState> cartStates;

  const CategoriesState({
    this.isLoading = true,
    this.isProductsLoading = true,
    this.productsList,
    this.categoriesList,
    this.errorMessage,
    this.cartStates = const {},
  });

  CategoriesState copyWith({
    bool? isLoading,
    bool? isProductsLoading,
    List<CategoryEntity>? categoriesList,
    List<ProductEntity>? productsList,
    String? errorMessage,
    Map<String?, BaseState>? cartStates,
  }) {
    return CategoriesState(
      isLoading: isLoading ?? this.isLoading,
      isProductsLoading: isProductsLoading ?? this.isProductsLoading,
      categoriesList: categoriesList ?? this.categoriesList,
      productsList: productsList ?? this.productsList,
      errorMessage: errorMessage ?? this.errorMessage,
      cartStates: cartStates ?? this.cartStates,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isProductsLoading,
    categoriesList,
    productsList,
    errorMessage,
    cartStates
  ];
}
