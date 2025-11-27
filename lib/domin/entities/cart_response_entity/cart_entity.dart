import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_item_entity.dart';
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
	 
	final String? id;
	final String? user;
	final List<CartItemEntity>? cartItems;
	final List<dynamic>? appliedCoupons;
	final int? totalPrice;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final int? v;

	const CartEntity({
		this.id, 
		this.user, 
		this.cartItems, 
		this.appliedCoupons, 
		this.totalPrice, 
		this.createdAt, 
		this.updatedAt, 
		this.v, 
	});


	@override
	List<Object?> get props {
		return [
				id,
				user,
				cartItems,
				appliedCoupons,
				totalPrice,
				createdAt,
				updatedAt,
				v,
		];
	}
}
