import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order_page/order_data.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order_page/orders_page.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';
import 'package:elevate_ecommerce_app/domin/models/response/order_page/orders_page.dart';

abstract class OrderPageMapper {
  static OrdersPageEntity toOrdersPageEntity({required OrdersPageDto orderdto}) {
    return OrdersPageEntity(
      message: orderdto.message,
      orders: orderdto.orders?.map((a) => toOrdersEntity(ordersdto: a))
    .toList(),
    );
  }


  static OrdersEntity toOrdersEntity({required OrdersDto ordersdto}) {
    return OrdersEntity(
     user: ordersdto.user,
      createdAt: ordersdto.createdAt,
      Id: ordersdto.Id,
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
