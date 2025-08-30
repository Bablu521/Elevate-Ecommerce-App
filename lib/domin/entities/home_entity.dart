import 'package:elevate_ecommerce_app/domin/entities/categories_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';

class HomeEntity {
  final String? message;
  final List<ProductEntity>? products;
  final List<CategoriesEntity>? categories;
  final List<ProductEntity>? bestSeller;
  final List<OccasionEntity>? occasions;

  HomeEntity({
    this.message,
    this.products,
    this.categories,
    this.bestSeller,
    this.occasions,
  });
}
