import 'package:equatable/equatable.dart';
import '../../../domin/entities/best_seller_product_entity.dart';
import '../../../domin/entities/category_entity.dart';
import '../../../domin/entities/occasion_entity.dart';
import '../../../domin/entities/product_entity.dart';

class HomeStates extends Equatable {
  final bool homeListIsLoading;
  final String? homeListErrorMessage;

  final List<CategoryEntity> categoriesListSuccess;
  final List<OccasionEntity> occasionListSuccess;
  final List<ProductEntity> productListSuccess;
  final List<BestSellerProductEntity> bestSellerListSuccess;

  const HomeStates({
    this.homeListIsLoading = false,
    this.homeListErrorMessage,
    this.categoriesListSuccess = const [],
    this.occasionListSuccess = const [],
    this.productListSuccess = const [],
    this.bestSellerListSuccess = const [],
  });

  HomeStates copyWith({
    bool? homeListIsLoading,
    String? homeListErrorMessage,
    List<CategoryEntity>? categoriesListSuccess,
    List<OccasionEntity>? occasionListSuccess,
    List<ProductEntity>? productListSuccess,
    List<BestSellerProductEntity>? bestSellerListSuccess,
  }) {
    return HomeStates(
      homeListIsLoading: homeListIsLoading ?? this.homeListIsLoading,
      homeListErrorMessage: homeListErrorMessage ?? this.homeListErrorMessage,
      categoriesListSuccess:
          categoriesListSuccess ?? this.categoriesListSuccess,
      occasionListSuccess: occasionListSuccess ?? this.occasionListSuccess,
      productListSuccess: productListSuccess ?? this.productListSuccess,
      bestSellerListSuccess:
          bestSellerListSuccess ?? this.bestSellerListSuccess,
    );
  }

  @override
  List<Object?> get props => [
    homeListIsLoading,
    homeListErrorMessage,
    categoriesListSuccess,
    occasionListSuccess,
    productListSuccess,
    bestSellerListSuccess,
  ];
}
