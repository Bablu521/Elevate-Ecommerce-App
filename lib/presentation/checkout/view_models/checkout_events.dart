sealed class CheckoutEvents {}

class GetUserCartEvent extends CheckoutEvents {}

class GetUserAddressesEvent extends CheckoutEvents {}

class CheckoutOrderEvent extends CheckoutEvents {}

class ChangeSelectedAddressEvent extends CheckoutEvents {
  final int index;
  ChangeSelectedAddressEvent(this.index);
}

class ChangeSelectedPaymentEvent extends CheckoutEvents {
  final int index;
  ChangeSelectedPaymentEvent(this.index);
}