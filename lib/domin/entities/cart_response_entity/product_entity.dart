import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
	final int? rateAvg;
	final int? rateCount;
	final String? id;
	final String? title;
	final String? slug;
	final String? description;
	final String? imgCover;
	final List<String>? images;
	final int? price;
	final int? priceAfterDiscount;
	final int? quantity;
	final String? category;
	final String? occasion;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final int? v;
	final bool? isSuperAdmin;
	final int? sold;
	

	const ProductEntity({
		this.rateAvg, 
		this.rateCount, 
		this.id, 
		this.title, 
		this.slug, 
		this.description, 
		this.imgCover, 
		this.images, 
		this.price, 
		this.priceAfterDiscount, 
		this.quantity, 
		this.category, 
		this.occasion, 
		this.createdAt, 
		this.updatedAt, 
		this.v, 
		this.isSuperAdmin, 
		this.sold, 
	});

	

	@override
	List<Object?> get props {
		return [
				rateAvg,
				rateCount,
				id,
				title,
				slug,
				description,
				imgCover,
				images,
				price,
				priceAfterDiscount,
				quantity,
				category,
				occasion,
				createdAt,
				updatedAt,
				v,
				isSuperAdmin,
				sold,
		];
	}
}
