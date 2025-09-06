import 'package:elevate_ecommerce_app/domin/repositories/categories_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entities/category_entity.dart';

@injectable
class GetAllCategoriesUseCase {
  final CategoriesRepo _categoriesRepo;

  GetAllCategoriesUseCase(this._categoriesRepo);

  Future<ApiResult<List<CategoryEntity>>> call() async {
    return await _categoriesRepo.getAllCategories();
  }
}
