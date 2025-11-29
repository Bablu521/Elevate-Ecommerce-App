import 'package:elevate_ecommerce_app/api/models/responses/categories/category_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';

extension CategoryMapper on CategoryDTO {
  CategoryEntity toEntity() {
    return CategoryEntity(
      Id: Id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isSuperAdmin: isSuperAdmin,
      productsCount: productsCount,
    );
  }
}
