import 'package:elevate_ecommerce_app/api/models/requestes/orders/order_request.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/orders/shipping_address_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/orders/cash_order_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/orders/credit_order_response.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/credit_order_entity.dart';

import '../../../domin/entities/address_entity.dart';

extension ShippingAddressMapper on ShippingAddressEntity {
  OrderRequest toOrderRequest() {
    return OrderRequest(
      shippingAddress: ShippingAddressDTO(
        street: street,
        phone: phone,
        city: city,
        lat: lat,
        long: long,
      ),
    );
  }
}

extension AddressRequestMapper on AddressEntity {
  ShippingAddressEntity toShippingAddressEntity() {
    return ShippingAddressEntity(
      street: street,
      phone: phone,
      city: city,
      lat: lat,
      long: long,
    );
  }
}

extension CashOrderMapper on CashOrderResponse {
  CashOrderEntity toEntity() {
    return CashOrderEntity(message: message);
  }
}

extension CreditOrderMapper on CreditOrderResponse {
  CreditOrderEntity toEntity() {
    return CreditOrderEntity(message: message, url: session?.url);
  }
}
