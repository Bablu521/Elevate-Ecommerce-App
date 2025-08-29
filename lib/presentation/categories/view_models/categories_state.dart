part of 'categories_view_model.dart';

class CategoriesState extends Equatable {
  final bool? isLoading;
  final bool? isProductsLoading;
  final List<CategoryEntity>? categoriesList;
  final List<ProductEntity>? productsList;
  final String? errorMessage;

  const CategoriesState({
    this.isLoading = false,
    this.isProductsLoading = false,
    this.productsList,
    this.categoriesList,
    this.errorMessage,
  });

  CategoriesState copyWith({
    bool? isLoading,
    bool? isProductsLoading,
    List<CategoryEntity>? categoriesList,
    List<ProductEntity>? productsList,
    String? errorMessage,
  }) {
    return CategoriesState(
      isLoading: isLoading ?? this.isLoading,
      isProductsLoading: isProductsLoading ?? this.isProductsLoading,
      categoriesList: categoriesList ?? this.categoriesList,
      productsList: productsList ?? this.productsList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isProductsLoading,
    categoriesList,
    productsList,
    errorMessage,
  ];
}
