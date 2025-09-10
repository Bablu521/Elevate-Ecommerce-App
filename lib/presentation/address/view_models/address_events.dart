sealed class AddressEvents {}

class OnLoadLoggedUserAddressesEvent extends AddressEvents {}

class OnRemoveAddressEvent extends AddressEvents {
  final String addressId;
  OnRemoveAddressEvent({required this.addressId});
}

class OnAddAddressEvent extends AddressEvents {}