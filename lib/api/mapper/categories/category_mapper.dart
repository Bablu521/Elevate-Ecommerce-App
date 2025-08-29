import 'package:elevate_ecommerce_app/api/models/responses/categories/category_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';

abstract class CategoryMapper {
  static CategoryEntity fromDTO(CategoryDTO dto) {
    return CategoryEntity(
      Id: dto.Id,
      name: dto.name,
      slug: dto.slug,
      image: dto.image,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      isSuperAdmin: dto.isSuperAdmin,
      productsCount: dto.productsCount,
    );
  }
}
