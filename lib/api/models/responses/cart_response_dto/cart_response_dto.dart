import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cart_dto.dart';

part 'cart_response_dto.g.dart';

@JsonSerializable()
class CartResponseDto extends Equatable {
  final String? message;
  final int? numOfCartItems;
  final CartDto? cart;

  const CartResponseDto({this.message, this.numOfCartItems, this.cart});

  factory CartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CartResponseDtoToJson(this);

  CartResponseEntity toCartResponseEntity() {
    return CartResponseEntity(
      message: message,
      numOfCartItems: numOfCartItems,
      cart: cart?.toCartEntity()
    );
  }

  @override
  List<Object?> get props => [message, numOfCartItems, cart];
}
