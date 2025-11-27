import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_entity.dart';
import 'package:equatable/equatable.dart';

class CartResponseEntity extends Equatable {
	final String? message;
	final int? numOfCartItems;
	final CartEntity? cart;

	const CartResponseEntity({this.message, this.numOfCartItems, this.cart});

	
	@override
	List<Object?> get props => [message, numOfCartItems, cart];
}
