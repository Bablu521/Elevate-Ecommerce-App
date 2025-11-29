import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/occasion_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionUseCase {
  final OccasionRepo _occasionRepo;
  OccasionUseCase(this._occasionRepo);

  Future<ApiResult<List<OccasionEntity>>> call() {
    return _occasionRepo.getAllOccasions();
  }
}
