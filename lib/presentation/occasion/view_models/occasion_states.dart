import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class OccasionStates extends Equatable {
  final bool occasionListIsLoading;
  final List<OccasionEntity> occasionListSuccess;
  final String? occasionListErrorMessage;

  final bool productListIsLoading;
  final List<ProductEntity> productListSuccess;
  final String? productListErrorMessage;

  const OccasionStates({
    this.occasionListIsLoading = false,
    this.occasionListSuccess = const [],
    this.occasionListErrorMessage,

    this.productListIsLoading = false,
    this.productListSuccess = const [],
    this.productListErrorMessage
    
  });

  OccasionStates copyWith({
    bool? occasionListIsLoading,
    List<OccasionEntity>? occasionListSuccess,
    String? occasionListErrorMessage,
    bool? productListIsLoading,
    List<ProductEntity>? productListSuccess,
    String? productListErrorMessage,
  }) {
    return OccasionStates(
      occasionListIsLoading:
          occasionListIsLoading ?? this.occasionListIsLoading,
      occasionListSuccess: occasionListSuccess ?? this.occasionListSuccess,
      occasionListErrorMessage: occasionListErrorMessage,
      productListIsLoading:
          productListIsLoading ?? this.productListIsLoading,
      productListSuccess: productListSuccess ?? this.productListSuccess,
      productListErrorMessage: productListErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    occasionListIsLoading,
    occasionListSuccess,
    occasionListErrorMessage,
    productListIsLoading,
    productListSuccess,
    productListErrorMessage,
  ];
}
