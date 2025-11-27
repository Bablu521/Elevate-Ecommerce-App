import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

import 'best_seller_product_entity.dart';
import 'category_entity.dart';

class HomeEntity extends Equatable {
  final String? message;
  final List<ProductEntity>? products;
  final List<CategoryEntity>? categories;
  final List<BestSellerProductEntity>? bestSeller;
  final List<OccasionEntity>? occasions;

  const HomeEntity({
    this.message,
    this.products,
    this.categories,
    this.bestSeller,
    this.occasions,
  });

  @override
  List<Object?> get props => [
    message,
    products,
    categories,
    bestSeller,
    occasions,
  ];
}
