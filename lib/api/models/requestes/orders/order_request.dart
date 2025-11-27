import 'package:elevate_ecommerce_app/api/models/requestes/orders/shipping_address_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest extends Equatable {
  @JsonKey(name: "shippingAddress")
  final ShippingAddressDTO? shippingAddress;

  const OrderRequest({
    this.shippingAddress,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) {
    return _$OrderRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderRequestToJson(this);
  }

  @override
  List<Object?> get props => [shippingAddress];
}