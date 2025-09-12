import 'package:elevate_ecommerce_app/domin/models/response/order_page/orders_page.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_orders_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/order_page/view_model/orders_event.dart';
import 'package:elevate_ecommerce_app/presentation/order_page/view_model/orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api_result/api_result.dart';

@injectable
class OrderViewModel extends Cubit<OrdersStates> {
  final GetOrdersUseCase _useCase;
  OrderViewModel(this._useCase, )
      : super(const OrdersStates());

  void doIntent(OrdersEvent event) {
    switch (event) {
      case OnLoadOrdersEvent():
        _getOrders();

    }
  }

  late List<OrdersPageEntity> profileListSuccess = [];

  Future<void> _getOrders() async {
    emit(state.copyWith(ordersListIsLoading: true));
    var result = await _useCase.call();
    switch (result) {
      case ApiSuccessResult<OrdersPageEntity>():
        emit(
          state.copyWith(
            ordersListIsLoading: false,
            ordersListSuccess: result.data,

          ),

        );

      case ApiErrorResult<OrdersPageEntity>():
        emit(
          state.copyWith(
            ordersListIsLoading: false,
            ordersListErrorMessage: result.errorMessage,
          ),
        );


    }
  }

  List<OrdersEntity> get activeOrders {
    return state.ordersListSuccess?.orders
        ?.where((order) => order.isPaid == false)
        .toList() ??
        [];
  }

  List<OrdersEntity> get completedOrders {
    return state.ordersListSuccess?.orders
        ?.where((order) => order.isPaid == true)
        .toList() ??
        [];
  }


}