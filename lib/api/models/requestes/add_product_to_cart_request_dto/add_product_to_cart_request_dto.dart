import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_product_to_cart_request_dto.g.dart';

@JsonSerializable()
class AddProductToCartRequestDto extends Equatable {
  final String? product;
  final int? quantity;

  const AddProductToCartRequestDto({this.product, this.quantity});

  factory AddProductToCartRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddProductToCartRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddProductToCartRequestDtoToJson(this);

  factory AddProductToCartRequestDto.fromDomain(
    AddProductToCartRequestEntity addProductToCartRequestEntity,
  ) {
    return AddProductToCartRequestDto(
      product: addProductToCartRequestEntity.product,
      quantity: addProductToCartRequestEntity.quantity
    );
  }

  @override
  List<Object?> get props => [product, quantity];
}
