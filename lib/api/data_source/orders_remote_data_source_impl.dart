import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate_ecommerce_app/api/mapper/orders/orders_mapper.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/credit_order_entity.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/orders_remote_data_source.dart';
import '../../domin/entities/firestore/order_firestore_entity.dart';
import '../client/api_client.dart';
import '../mapper/order/order_page_mapper.dart';

@Injectable(as: OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource {
  final ApiClient _apiClient;
  final FirebaseFirestore _firestore;

  OrdersRemoteDataSourceImpl(this._apiClient, this._firestore);

  @override
  Future<ApiResult<OrdersPageEntity>> getOrders() async {
    try {
      final response = await _apiClient.getOrders();
      final responseEntity = OrderPageMapper.toOrdersPageEntity(
        orderdto: response,
      );
      return ApiSuccessResult(responseEntity);
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<CashOrderEntity>> checkoutCashOrder(
    ShippingAddressEntity shippingAddressEntity,
  ) {
    return safeApiCall(
      () =>
          _apiClient.checkoutCashOrder(shippingAddressEntity.toOrderRequest()),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<CreditOrderEntity>> checkoutCreditOrder(
    ShippingAddressEntity shippingAddressEntity,
  ) {
    return safeApiCall(
      () => _apiClient.checkoutCreditOrder(
        shippingAddressEntity.toOrderRequest(),
      ),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<OrderFirestoreEntity>> getFirestoreOrder(
      String orderId,
      ) async {
    try {
      final doc = await _firestore.collection('orders').doc(orderId).get();
      if (doc.exists) {
        return ApiSuccessResult(OrderFirestoreEntity.fromMap(doc.data()!));
      } else {
        return ApiErrorResult("Document does not exist");
      }
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Stream<ApiResult<OrderFirestoreEntity>> streamFirestoreOrder(String orderId) async* {
    try {
      await for (final doc in _firestore.collection('orders').doc(orderId).snapshots()) {
        if (doc.exists) {
          yield ApiSuccessResult(OrderFirestoreEntity.fromMap(doc.data()!));
        } else {
          yield ApiErrorResult("Document does not exist");
        }
      }
    } catch (e) {
      yield ApiErrorResult(e.toString());
    }
  }
}
