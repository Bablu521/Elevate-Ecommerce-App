import 'package:elevate_ecommerce_app/api/mapper/order/order_page_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order_page/order_data.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order_page/orders_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call edit orderPage with null value return orderPage with null value', () {
    final OrdersPageDto ordersPageDto =OrdersPageDto(
      orders: null,
      message: null,
    );
    final result =OrderPageMapper.toOrdersPageEntity(orderdto: ordersPageDto);
    expect(result.message, null);
    expect(result.orders, null);
  });
  test('when call orderPage with non-null value '
      'return orderPage with right value', () {
    final OrdersPageDto ordersPageDto =OrdersPageDto(
      orders: [OrdersDto()] ,
      message: "message",
    );

    final result =OrderPageMapper.toOrdersPageEntity(orderdto: ordersPageDto);
    expect(result.message, equals(ordersPageDto.message));
    // expect(result.user, equals(editProfileDto.user?.toUserEntity()));
  });
}