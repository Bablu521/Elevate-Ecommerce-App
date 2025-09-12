import 'package:elevate_ecommerce_app/api/models/responses/orders/order_items_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_dto.g.dart';

@JsonSerializable()
class OrderDTO {
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "orderItems")
  final List<OrderItemsDTO>? orderItems;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "paymentType")
  final String? paymentType;
  @JsonKey(name: "isPaid")
  final bool? isPaid;
  @JsonKey(name: "isDelivered")
  final bool? isDelivered;
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "__v")
  final int? v;

  OrderDTO ({
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return _$OrderDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderDTOToJson(this);
  }
}