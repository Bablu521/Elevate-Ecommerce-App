sealed class LocationEvents {}

class GetOrderLocationEvent extends LocationEvents {
  final String orderId;

  GetOrderLocationEvent(this.orderId);
}

class LunchCallLocationEvent extends LocationEvents {
  final String phoneNumber;

  LunchCallLocationEvent(this.phoneNumber);
}

class LunchWhatsAppLocationEvent extends LocationEvents {
  final String phoneNumber;

  LunchWhatsAppLocationEvent(this.phoneNumber);
}