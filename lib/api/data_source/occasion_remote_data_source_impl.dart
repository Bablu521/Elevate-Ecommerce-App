import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/occasion_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OccasionRemoteDataSource)
class OccasionRemoteDataSourceImpl implements OccasionRemoteDataSource {
  final ApiClient _apiClient;
  OccasionRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<OccasionEntity>>> getAllOccasions() async {
    return safeApiCall(
      () => _apiClient.getAllOccasions(),
      (response) =>
          response.occasions!
              .map((element) => element.toOccasOccasionEntity())
              .toList(),
    );
  }
}
