import 'package:elevate_ecommerce_app/api/models/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_items_dto.g.dart';

@JsonSerializable()
class OrderItemsDTO {
  @JsonKey(name: "product")
  final ProductDto? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? id;

  OrderItemsDTO ({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  factory OrderItemsDTO.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsDTOToJson(this);
  }
}