import 'package:equatable/equatable.dart';

class BestSellerProductEntity extends Equatable {
  final String? id;
  final String? mongoId;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final double? price;
  final double? priceAfterDiscount;
  final double? discount;
  final int? quantity;
  final double? rateAvg;
  final int? rateCount;
  final int? sold;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final bool? isSuperAdmin;

  const BestSellerProductEntity({
    this.id,
    this.mongoId,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.discount,
    this.quantity,
    this.rateAvg,
    this.rateCount,
    this.sold,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
  });

  @override
  List<Object?> get props => [
    id,
    mongoId,
    title,
    slug,
    description,
    imgCover,
    images,
    price,
    priceAfterDiscount,
    discount,
    quantity,
    rateAvg,
    rateCount,
    sold,
    category,
    occasion,
    createdAt,
    updatedAt,
    isSuperAdmin,
  ];
}
