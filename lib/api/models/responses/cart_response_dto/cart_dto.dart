import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cart_item_dto.dart';

part 'cart_dto.g.dart';

@JsonSerializable()
class CartDto extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? user;
  final List<CartItemDto>? cartItems;
  final List<dynamic>? appliedCoupons;
  final int? totalPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  const CartDto({
    this.id,
    this.user,
    this.cartItems,
    this.appliedCoupons,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDtoToJson(this);

  CartEntity toCartEntity() {
    return CartEntity(
      id:id,
      user:user,
      cartItems: cartItems?.map((item) => item.toCartItemEntity()).toList(),
      appliedCoupons:appliedCoupons,
      totalPrice:totalPrice,
      createdAt:createdAt,
      updatedAt:updatedAt,
      v:v
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      user,
      cartItems,
      appliedCoupons,
      totalPrice,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
