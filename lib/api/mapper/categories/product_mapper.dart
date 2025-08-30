import '../../../domin/entities/product_entity.dart';
import '../../models/responses/products/product_dto.dart';

abstract class ProductMapper {
  static ProductEntity fromDTO(ProductDTO dto) {
    return ProductEntity(
      rateAvg: dto.rateAvg,
      rateCount: dto.rateCount,
      Id: dto.Id,
      title: dto.title,
      slug: dto.slug,
      description: dto.description,
      imgCover: dto.imgCover,
      images: dto.images,
      price: dto.price,
      priceAfterDiscount: dto.priceAfterDiscount,
      quantity: dto.quantity,
      category: dto.category,
      occasion: dto.occasion,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      v: dto.v,
      isSuperAdmin: dto.isSuperAdmin,
      sold: dto.sold,
      id: dto.id,
    );
  }
}