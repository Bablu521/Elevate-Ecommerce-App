import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/occasion_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/occasion_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OccasionRepo)
class OccasionRepoImpl implements OccasionRepo {
  final OccasionRemoteDataSource _occasionRemoteDataSource;
  OccasionRepoImpl(this._occasionRemoteDataSource);
  
  @override
  Future<ApiResult<List<OccasionEntity>>> getAllOccasions() {
    return _occasionRemoteDataSource.getAllOccasions();
  }
}
