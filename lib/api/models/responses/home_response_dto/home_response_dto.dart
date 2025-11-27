import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_product_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/categories/category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../occasion_dto.dart';
import '../../product_dto.dart';

part 'home_response_dto.g.dart';

@JsonSerializable()
class HomeDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "products")
  final List<ProductDto>? products;
  @JsonKey(name: "categories")
  final List<CategoryDTO>? categories;
  @JsonKey(name: "bestSeller")
  final List<BestSellerProductDto>? bestSeller;
  @JsonKey(name: "occasions")
  final List<OccasionDto>? occasions;

  HomeDto ({
    this.message,
    this.products,
    this.categories,
    this.bestSeller,
    this.occasions,
  });

  factory HomeDto.fromJson(Map<String, dynamic> json) {
    return _$HomeDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeDtoToJson(this);
  }
}











