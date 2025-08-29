import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/core/mapper/home_mapper.dart';
import 'package:elevate_ecommerce_app/domin/entities/home_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api_result/api_result.dart';
import '../../../data/data_source/home/home_data_source.dart';

@Injectable(as:HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{

  final ApiClient apiClient;
  HomeRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<ApiResult<HomeEntity>> getHome()async {

    try{
      final result =await apiClient.getHome();
      final resultDto=result.toEntity();

       return ApiSuccessResult<HomeEntity>(resultDto);

    }
    catch(error){
     return ApiErrorResult<HomeEntity>(error);

    }



  }

}


