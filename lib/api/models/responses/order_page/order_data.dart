import 'package:json_annotation/json_annotation.dart';

part 'order_data.g.dart';

@JsonSerializable()
class OrdersDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "user")
  final String? user;
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
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "__v")
  final int? V;

  OrdersDto ({
    this.Id,
    this.user,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.V,
  });

  factory OrdersDto.fromJson(Map<String, dynamic> json) {
    return _$OrdersDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersDtoToJson(this);
  }
}
