import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/firestore/order_firestore_entity.dart';
import '../repositories/orders_repo.dart';

@injectable
class GetOrderFromFirestoreUseCase {
  final OrdersRepo _ordersRepo;

  GetOrderFromFirestoreUseCase(this._ordersRepo);

  Future<ApiResult<OrderFirestoreEntity>> call({required String orderId}) {
    return _ordersRepo.getFirestoreOrder(orderId);
  }
}
