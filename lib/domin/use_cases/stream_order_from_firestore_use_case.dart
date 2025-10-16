import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/firestore/order_firestore_entity.dart';
import '../repositories/orders_repo.dart';

@injectable
class StreamOrderFromFirestoreUseCase {
  final OrdersRepo _ordersRepo;

  StreamOrderFromFirestoreUseCase(this._ordersRepo);

  Stream<ApiResult<OrderFirestoreEntity>> call({required String orderId}) {
    return _ordersRepo.streamFirestoreOrder(orderId);
  }
}
