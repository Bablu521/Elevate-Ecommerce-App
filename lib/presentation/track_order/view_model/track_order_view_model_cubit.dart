import 'dart:async';

import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/firestore/order_firestore_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/stream_order_from_firestore_use_case.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view_model/track_order_view_model_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

part 'track_order_view_model_state.dart';

@injectable
class TrackOrderViewModelCubit extends Cubit<TrackOrderViewModelState> {
  TrackOrderViewModelCubit(this.streamOrderFromFirestoreUseCase)
    : super(const TrackOrderViewModelState());
  final StreamOrderFromFirestoreUseCase streamOrderFromFirestoreUseCase;
  void doIntent(TrackOrderViewModelEvent event) {
    switch (event) {
      case TrackOrderViewModelGetOrderFromFireBaseEvent():
        _getOrderFromFireBase(event.orderId);
      case TrackOrderViewModelDirectToWhatsApp():
        _openWhatsApp(phone: event.phoneNumber);
      case TrackOrderViewModelDirectCall():
        _callNumber(event.phoneNumber);
    }
  }

  StreamSubscription<ApiResult<OrderFirestoreEntity>>? _orderSubscription;

  Future<void> _getOrderFromFireBase(String orderId) async {
    emit(
      state.copyWith(orderEntity: BaseState<OrderFirestoreEntity>.loading()),
    );
    await _orderSubscription?.cancel();

    _orderSubscription = streamOrderFromFirestoreUseCase
        .call(orderId: orderId)
        .listen((result) {
          switch (result) {
            case ApiSuccessResult<OrderFirestoreEntity>():
              _getStatusOrder(result.data.order?.state);
              emit(
                state.copyWith(
                  orderEntity: BaseState<OrderFirestoreEntity>.success(
                    result.data,
                  ),
                ),
              );
            case ApiErrorResult<OrderFirestoreEntity>():
              emit(
                state.copyWith(
                  orderEntity: BaseState<OrderFirestoreEntity>.error(
                    result.errorMessage,
                  ),
                ),
              );
          }
        });
  }

  final List<String> orderStatus = [
    "pending",
    "picked",
    "out for delivery",
    "arrived",
    "delivered",
  ];
  String status = "";
  int orderStateNumber = 0;
  int _getStatusOrder(String? orderStatus) {
    final int currentIndex = this.orderStatus.indexOf(
      orderStatus ?? this.orderStatus.first,
    );

    orderStateNumber = (currentIndex).clamp(0, this.orderStatus.length - 1);
    status = this.orderStatus[orderStateNumber];
    return orderStateNumber;
  }

  final List<String> statusTitle = [
    AppLocalizations().pending,
    AppLocalizations().picked,
    AppLocalizations().outForDelivery,
    AppLocalizations().arrived,
    AppLocalizations().delivered,
  ];
  Future<void> _openWhatsApp({
    required String phone,
    String message = '',
  }) async {
    final Uri whatsappUri = Uri.parse(
      "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception("Could not launch WhatsApp");
    }
  }

  Future<void> _callNumber(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch dialer');
    }
  }

  @override
  Future<void> close() {
    _orderSubscription?.cancel();
    return super.close();
  }
}
