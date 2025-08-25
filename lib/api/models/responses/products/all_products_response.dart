import 'package:elevate_ecommerce_app/api/models/responses/meta_data.dart';
import 'package:elevate_ecommerce_app/api/models/responses/products/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_products_response.g.dart';

@JsonSerializable()
class AllProductsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetaData? metadata;
  @JsonKey(name: "products")
  final List<ProductDTO>? products;

  AllProductsResponse({this.message, this.metadata, this.products});

  factory AllProductsResponse.fromJson(Map<String, dynamic> json) {
    return _$AllProductsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllProductsResponseToJson(this);
  }
}
