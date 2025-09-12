import 'package:elevate_ecommerce_app/api/mapper/order/order_page_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order_page/order_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when we send order with null value return null', () {
    OrdersDto ordersDto =OrdersDto(
      V:null,
      state:null,
      totalPrice:null,
      Id:null,
      user:null,
      updatedAt:null,
      paymentType:null,
      orderNumber:null,
      isPaid:null,
      isDelivered:null,
      createdAt:null,
    );
    var res =OrderPageMapper.toOrdersEntity(ordersdto: ordersDto);
    expect(res.createdAt, equals(null));
    expect(res.V, equals(null));
    expect(res.state, equals(null));
    expect(res.isDelivered, equals(null));
    expect(res.isPaid, equals(null));
    expect(res.orderNumber, equals(null));
    expect(res.paymentType, equals(null));
    expect(res.updatedAt, equals(null));
    expect(res.user, equals(null));
    expect(res.Id, equals(null));
    expect(res.totalPrice, equals(null));
  });
  test('when we send order with non_null value return order value', () {
    OrdersDto ordersDto =OrdersDto(
      V:12,
      state:"null",
      totalPrice:21,
      Id:"123",
      user:"asc",
      updatedAt:"null",
      paymentType:"null",
      orderNumber:"123",
      isPaid:true,
      isDelivered:false,
      createdAt:"Asc",
    );
    var res =OrderPageMapper.toOrdersEntity(ordersdto: ordersDto);
    expect(res.createdAt, equals(res.createdAt));
    expect(res.V, equals(res.V ));
    expect(res.state, equals(res.state));
    expect(res.isDelivered, equals(res.isDelivered));
    expect(res.isPaid, equals(res.isPaid));
    expect(res.orderNumber, equals(res.orderNumber));
    expect(res.paymentType, equals(res.paymentType));
    expect(res.updatedAt, equals(res.updatedAt));
    expect(res.user, equals(res.user));
    expect(res.Id, equals(res.Id));
    expect(res.totalPrice, equals(res.totalPrice));
  });

}