import 'dart:io';

import 'package:elevate_ecommerce_app/api/mapper/orders/orders_mapper.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/checkout_cash_order_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/checkout_credit_order_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_logged_user_cart_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../domin/entities/responses/orders/credit_order_entity.dart';
import '../../../domin/use_cases/get_logged_user_addresses_use_case.dart';
import 'checkout_events.dart';

part 'checkout_state.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckoutState> {
  final GetLoggedUserCartUseCase _getLoggedUserCartUseCase;
  final GetLoggedUserAddressesUseCase _getLoggedUserAddressesUseCase;
  final CheckoutCashOrderUseCase _checkoutCashOrderUseCase;
  final CheckoutCreditOrderUseCase _checkoutCreditOrderUseCase;

  CheckoutViewModel(
    this._getLoggedUserCartUseCase,
    this._getLoggedUserAddressesUseCase,
    this._checkoutCashOrderUseCase,
    this._checkoutCreditOrderUseCase,
  ) : super(const CheckoutState());

  ValueNotifier<int> selectedAddressIndex = ValueNotifier<int>(0);
  ValueNotifier<int> selectedPaymentIndex = ValueNotifier<int>(0);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late WebViewController webViewController;

  int deliveryFee = 10;

  void doIntent(CheckoutEvents events) {
    switch (events) {
      case GetUserCartEvent():
        _getLoggedUserCart();
      case GetUserAddressesEvent():
        _getLoggedUserAddresses();
      case CheckoutOrderEvent():
        _checkoutOrder();
      case ChangeSelectedAddressEvent():
        _changeSelectedAddress(events.index);
      case ChangeSelectedPaymentEvent():
        _changeSelectedPayment(events.index);
    }
  }

  Future<void> _getLoggedUserCart() async {
    final result = await _getLoggedUserCartUseCase();
    switch (result) {
      case ApiSuccessResult<CartResponseEntity>():
        emit(
          state.copyWith(
            subTotal: result.data.cart?.totalPrice,
            total: (result.data.cart!.totalPrice! + deliveryFee),
          ),
        );
      case ApiErrorResult<CartResponseEntity>():
        emit(state.copyWith(errorMessage: result.errorMessage));
    }
  }

  Future<void> _getLoggedUserAddresses() async {
    final result = await _getLoggedUserAddressesUseCase();
    switch (result) {
      case ApiSuccessResult<List<AddressEntity>>():
        emit(state.copyWith(addressesList: result.data));
      case ApiErrorResult<List<AddressEntity>>():
        emit(state.copyWith(errorMessage: result.errorMessage));
    }
  }

  Future<void> _checkoutOrder() async {
    emit(state.copyWith(isLoading: true));
    final body = state.addressesList![selectedAddressIndex.value]
        .toShippingAddressEntity();
    if (selectedPaymentIndex.value == 0) {
      final result = await _checkoutCashOrderUseCase(body);
      switch (result) {
        case ApiSuccessResult<CashOrderEntity>():
          emit(state.copyWith(isSuccessCashOrder: true));
        case ApiErrorResult<CashOrderEntity>():
          emit(state.copyWith(errorMessage: result.errorMessage));
      }
    } else {
      final result = await _checkoutCreditOrderUseCase(body);
      switch (result) {
        case ApiSuccessResult<CreditOrderEntity>():
          _initWebView(result.data.url ?? "");
          emit(state.copyWith(isSuccessCreditOrder: true));
        case ApiErrorResult<CreditOrderEntity>():
          emit(state.copyWith(errorMessage: result.errorMessage));
      }
    }
  }

  void _changeSelectedAddress(int index) {
    selectedAddressIndex.value = index;
  }

  void _changeSelectedPayment(int index) {
    selectedPaymentIndex.value = index;
  }

  void _initWebView(String url) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return;
    }
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    selectedAddressIndex.dispose();
    selectedPaymentIndex.dispose();
    return super.close();
  }
}
