import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_product_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';

extension BestSellerMapper on BestSellerProductDto {
  BestSellerProductEntity toEntity() {
    return BestSellerProductEntity(
      id: id,
      price: price,
      title: title,
      category: category,
      quantity: quantity,
      imgCover: imgCover,
      images: images,
      description: description,
      isSuperAdmin: isSuperAdmin,
      rateAvg: rateAvg,
      occasion: occasion,
      rateCount: rateCount,
      priceAfterDiscount: priceAfterDiscount,
      slug: slug,
      sold: sold,
    );
  }
}

extension BestSellerToProductMapper on BestSellerProductEntity {
  ProductEntity toProductEntity() {
    return ProductEntity(
      id: id,
      title: title,
      slug: slug,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price?.toInt(),
      priceAfterDiscount: priceAfterDiscount?.toInt(),
      quantity: quantity,
      category: category,
      occasion: occasion,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
      isSuperAdmin: isSuperAdmin,
      sold: sold,
      rateAvg: rateAvg?.toInt(),
      rateCount: rateCount,
      v: null,
    );
  }
}
