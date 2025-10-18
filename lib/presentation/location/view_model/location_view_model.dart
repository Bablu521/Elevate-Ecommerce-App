import 'dart:async';

import 'package:elevate_ecommerce_app/domin/use_cases/stream_order_from_firestore_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/api_result/api_result.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../domin/entities/firestore/order_firestore_entity.dart';
import '../../../generated/l10n.dart';
import 'location_events.dart';

part 'location_state.dart';

@injectable
class LocationViewModel extends Cubit<LocationState> {
  final StreamOrderFromFirestoreUseCase _streamOrderFromFirestoreUseCase;

  LocationViewModel(this._streamOrderFromFirestoreUseCase)
    : super(const LocationState());

  GoogleMapController? mapController;

  late final LatLng apartmentLocation;
  late final LatLng storeLocation;
  LatLng? liveLocation;

  late final BitmapDescriptor yourLocationIcon;
  late final BitmapDescriptor storeIcon;
  late final BitmapDescriptor liveLocationIcon;

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  late StreamSubscription<ApiResult<OrderFirestoreEntity>> orderStream;

  bool isFirstTime = true;

  void doIntent(LocationEvents events) {
    switch (events) {
      case GetOrderLocationEvent():
        _streamOrder(events.orderId);
      case LunchCallLocationEvent():
        _callNumber(events.phoneNumber);
      case LunchWhatsAppLocationEvent():
        _openWhatsApp(phone: events.phoneNumber);
    }
  }

  Future<void> _streamOrder(String orderId) async {
    initIcons();
    orderStream = _streamOrderFromFirestoreUseCase(orderId: orderId).listen((
      order,
    ) async {
      switch (order) {
        case ApiSuccessResult<OrderFirestoreEntity>():
          if (isFirstTime) {
            isFirstTime = false;
            initLocations(order.data);
            emit(state.copyWith(order: order.data));
          }
          liveLocation = LatLng(
            double.parse(order.data.location?.lat ?? "0"),
            double.parse(order.data.location?.long ?? "0"),
          );
          initMarkers();
          mapController?.animateCamera(CameraUpdate.newLatLng(liveLocation!));
          emit(
            state.copyWith(
              isLoading: false,
              markers: markers,
              polylines: polylines,
            ),
          );
        case ApiErrorResult<OrderFirestoreEntity>():
          emit(
            state.copyWith(isLoading: false, errorMessage: order.errorMessage),
          );
      }
    });
  }

  Future<void> initIcons() async {
    yourLocationIcon = await BitmapDescriptor.asset(
      ImageConfiguration.empty,
      AppImages.apartmentImage,
    );
    storeIcon = await BitmapDescriptor.asset(
      ImageConfiguration.empty,
      AppImages.floweryImage,
    );
    liveLocationIcon = await BitmapDescriptor.asset(
      ImageConfiguration.empty,
      AppImages.motorcycleDeliveryImage,
    );
  }

  void initLocations(OrderFirestoreEntity result) {
    apartmentLocation = LatLng(
      double.parse(result.order?.shippingAddress?.lat ?? "0"),
      double.parse(result.order?.shippingAddress?.long ?? "0"),
    );
    final latLongString = result.order?.store?.latLong ?? "0,0";
    final latLongList = latLongString.split(',');

    storeLocation = LatLng(
      double.parse(latLongList[0]),
      double.parse(latLongList[1]),
    );
  }

  void initMarkers() {
    markers.clear();
    markers = {
      buildMarker(
        markerId: AppLocalizations().apartment,
        position: apartmentLocation,
        title: AppLocalizations().apartment,
        icon: yourLocationIcon,
      ),
      buildMarker(
        markerId: AppLocalizations().flowery,
        position: storeLocation,
        title: AppLocalizations().flowery,
        icon: storeIcon,
      ),
      buildMarker(
        markerId: AppLocalizations().liveLocation,
        position: liveLocation!,
        title: AppLocalizations().liveLocation,
        icon: liveLocationIcon,
      ),
    };

    polylines.clear();
    polylines = {
      Polyline(
        polylineId: const PolylineId('route'),
        color: AppColors.mainColor,
        width: 2,
        points: [apartmentLocation, storeLocation],
      ),
    };
  }

  Marker buildMarker({
    required String markerId,
    required LatLng position,
    required String title,
    required BitmapDescriptor icon,
  }) {
    return Marker(
      markerId: MarkerId(markerId),
      position: position,
      infoWindow: InfoWindow(title: title),
      icon: icon,
    );
  }

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
}
