import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
	final ProductEntity? product;
	final int? price;
	final int? quantity;
	final String? id;

	const CartItemEntity({this.product, this.price, this.quantity, this.id});


	@override
	List<Object?> get props => [product, price, quantity, id];
}
