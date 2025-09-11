import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/data/data_source/best_seller_remote_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/best_seller_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BestSellerRepo)
class BestSellerRepoImpl implements BestSellerRepo {
  final BestSellerRemoteDataSource _bestSellerRemoteDataSource;

  BestSellerRepoImpl(this._bestSellerRemoteDataSource);
  @override
  Future<ApiResult<List<BestSellerProductEntity>>> getBestSeller() async {
    return await _bestSellerRemoteDataSource.getBestSeller();
  }
}
