import 'package:elevate_ecommerce_app/api/models/requestes/orders/shipping_address_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest {
  @JsonKey(name: "shippingAddress")
  final ShippingAddressDTO? shippingAddress;

  OrderRequest ({
    this.shippingAddress,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) {
    return _$OrderRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderRequestToJson(this);
  }
}