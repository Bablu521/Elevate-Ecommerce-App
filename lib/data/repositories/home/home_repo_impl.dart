import 'package:elevate_ecommerce_app/domin/entities/home_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api_result/api_result.dart';
import '../../../domin/repositories/home/home_repo.dart';
import '../../data_source/home/home_data_source.dart';

@Injectable(as:HomeRepo)
class HomeRepoImpl extends HomeRepo{
   final HomeRemoteDataSource homeRemoteDataSource;
   HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<ApiResult<HomeEntity>> getHome() {
    final homeDto=homeRemoteDataSource.getHome();
    return homeDto;

  }

}