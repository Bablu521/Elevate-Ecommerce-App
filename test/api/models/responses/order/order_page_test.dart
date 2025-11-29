import 'package:elevate_ecommerce_app/api/mapper/order/order_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order/order_data.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order/order_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call edit orderPage with null value return orderPage with null value', () {
    // TODO: Implement test
    OrdersPageDto ordersPageDto =OrdersPageDto(
      orders: null,
      message: null,
    );
    final result =OrderPageMapper.toOrdersPageEntity(orderdto: ordersPageDto);
    expect(result.message, null);
    expect(result.orders, null);
  });
  test('when call orderPage with non-null value '
      'return orderPage with right value', () {
    // TODO: Implement test
    OrdersPageDto ordersPageDto =OrdersPageDto(
      orders: [OrdersDto()] ,
      message: "message",
    );

    var result =OrderPageMapper.toOrdersPageEntity(orderdto: ordersPageDto);
    expect(result.message, equals(ordersPageDto.message));
    // expect(result.user, equals(editProfileDto.user?.toUserEntity()));
  });
}