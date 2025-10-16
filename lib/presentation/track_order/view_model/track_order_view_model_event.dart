sealed class TrackOrderViewModelEvent {}

class TrackOrderViewModelGetOrderFromFireBaseEvent
    extends TrackOrderViewModelEvent {
  final String orderId;

  TrackOrderViewModelGetOrderFromFireBaseEvent({required this.orderId});
}

class TrackOrderViewModelDirectToWhatsApp extends TrackOrderViewModelEvent {
  final String phoneNumber;

  TrackOrderViewModelDirectToWhatsApp({required this.phoneNumber});
}

class TrackOrderViewModelDirectCall extends TrackOrderViewModelEvent {
  final String phoneNumber;

  TrackOrderViewModelDirectCall({required this.phoneNumber});
}
