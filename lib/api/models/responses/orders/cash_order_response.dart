import 'package:json_annotation/json_annotation.dart';

import 'order_dto.dart';

part 'cash_order_response.g.dart';

@JsonSerializable()
class CashOrderResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "order")
  final OrderDTO? order;

  CashOrderResponse({this.message, this.order});

  factory CashOrderResponse.fromJson(Map<String, dynamic> json) {
    return _$CashOrderResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CashOrderResponseToJson(this);
  }
}
