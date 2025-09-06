import '../../../domin/entities/product_entity.dart';
import '../../models/responses/products/product_dto.dart';

extension ProductMapper on ProductDTO {
  ProductEntity toEntity() {
    return ProductEntity(
      rateAvg: rateAvg,
      rateCount: rateCount,
      Id: Id,
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
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      isSuperAdmin: isSuperAdmin,
      sold: sold,
      id: id,
    );
  }
}
