import 'package:elevate_ecommerce_app/domin/entities/firestore/store_entity.dart';
import 'package:equatable/equatable.dart';

import 'order_entity.dart';

class DriverOrderEntity extends Equatable {
  final String? id;
  final String? driver;
  final OrderEntity? order;
  final int? v;
  final String? createdAt;
  final String? updatedAt;
  final StoreEntity? store;

  const DriverOrderEntity({
    this.id,
    this.driver,
    this.order,
    this.v,
    this.createdAt,
    this.updatedAt,
    this.store,
  });

  @override
  List<Object?> get props =>
      [id, driver, order, v, createdAt, updatedAt, store,];
}
