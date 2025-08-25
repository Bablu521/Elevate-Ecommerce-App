import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';

import '../entities/category_entity.dart';

abstract class CategoriesRepo {
  Future<ApiResult<List<CategoryEntity>>> getAllCategories();
}
