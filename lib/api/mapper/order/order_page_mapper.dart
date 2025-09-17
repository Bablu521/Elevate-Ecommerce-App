import 'package:elevate_ecommerce_app/api/models/responses/order_page/order_data.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order_page/orders_page.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';

abstract class OrderPageMapper {
  static OrdersPageEntity toOrdersPageEntity({
    required OrdersPageDto orderdto,
  }) {
    return OrdersPageEntity(
      message: orderdto.message,
      orders: orderdto.orders
          ?.map((a) => toOrdersEntity(ordersdto: a))
          .toList(),
    );
  }

  static OrdersEntity toOrdersEntity({required OrdersDto ordersdto}) {
    return OrdersEntity(
      user: ordersdto.user,
      createdAt: ordersdto.createdAt,
      id: ordersdto.id,
      isDelivered: ordersdto.isDelivered,
      isPaid: ordersdto.isPaid,
      orderNumber: ordersdto.orderNumber,
      paymentType: ordersdto.paymentType,
      state: ordersdto.state,
      totalPrice: ordersdto.totalPrice,
      updatedAt: ordersdto.updatedAt,
      V: ordersdto.V,
    );
  }
}
