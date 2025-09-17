import 'package:equatable/equatable.dart';

class OrdersPageEntity extends Equatable {
  final String? message;

  final List<OrdersEntity>? orders;

  const OrdersPageEntity ({
    this.message,
    this.orders,
  });

   @override
  List<Object?> get props => [
   message,
     orders,
  ];


}



class OrdersEntity extends Equatable {
  final String? id;
  final String? user;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final int? V;

  const OrdersEntity ({
    this.id,
    this.user,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.V,
  });

  @override
  List<Object?> get props => [
    id,
    orderNumber,
    user,
    state,
    isDelivered,
    isPaid,
    paymentType,
    totalPrice,
    createdAt,
    updatedAt,
    V,
  ];

}




