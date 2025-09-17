import 'package:json_annotation/json_annotation.dart';
import 'order_data.dart';
part 'orders_page.g.dart';

@JsonSerializable()
class OrdersPageDto {
  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "orders")
  final List<OrdersDto>? orders;

  OrdersPageDto ({
    this.message,
    this.orders,
  });

  factory OrdersPageDto.fromJson(Map<String, dynamic> json) {
    return _$OrdersPageDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersPageDtoToJson(this);
  }
}







