
import 'package:elevate_ecommerce_app/domin/models/response/order_page/orders_page.dart';
import 'package:equatable/equatable.dart';


class OrdersStates extends Equatable {
  final bool ordersListIsLoading;
  final String? ordersListErrorMessage;

  final OrdersPageEntity? ordersListSuccess;
  final bool? isLogged;


  const OrdersStates(
       {
    this.ordersListIsLoading = false,
    this.ordersListErrorMessage,
    this.ordersListSuccess,
    this.isLogged,


  });

  OrdersStates copyWith({
    bool? ordersListIsLoading,
    String? ordersListErrorMessage,
    OrdersPageEntity? ordersListSuccess,
    bool? isLogged,

  }) {
    return OrdersStates(
      ordersListIsLoading: ordersListIsLoading ?? this.ordersListIsLoading,
      ordersListErrorMessage: ordersListErrorMessage ?? this.ordersListErrorMessage,
      ordersListSuccess: ordersListSuccess ?? this.ordersListSuccess,
      isLogged: isLogged,



    );
  }

  @override
  List<Object?> get props => [
    ordersListIsLoading,
    ordersListErrorMessage,
    ordersListSuccess,
    isLogged



  ];

  @override
  bool? get stringify => true;



}