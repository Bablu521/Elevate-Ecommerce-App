import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto extends Equatable {
  final int? rateAvg;
  final int? rateCount;
  @JsonKey(name: '_id')
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
  @JsonKey(name: '__v')
  final int? v;
  final bool? isSuperAdmin;
  final int? sold;

  const ProductDto({
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

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return _$ProductDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  ProductEntity toProductEntity() {
    return ProductEntity(
      rateAvg: rateAvg,
      rateCount: rateCount,
      id: id,
      title: title,
      slug: slug,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      category: category,
      occasion: occasion,
      createdAt: createdAt.toString(),
      updatedAt: updatedAt.toString(),
      v: v,
      isSuperAdmin: isSuperAdmin,
      sold: sold,
    );
  }

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
      id,
    ];
  }
}
