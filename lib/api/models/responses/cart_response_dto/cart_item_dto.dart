import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_item_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product_dto.dart';

part 'cart_item_dto.g.dart';

@JsonSerializable()
class CartItemDto extends Equatable {
  final ProductDto? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  const CartItemDto({this.product, this.price, this.quantity, this.id});

  factory CartItemDto.fromJson(Map<String, dynamic> json) {
    return _$CartItemDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CartItemDtoToJson(this);

  CartItemEntity toCartItemEntity() {
    return CartItemEntity(
      product: product?.toProductEntity(),
      price: price,
      quantity: quantity,
      id: id
    );
  }

  @override
  List<Object?> get props => [product, price, quantity, id];
}
