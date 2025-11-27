import 'package:elevate_ecommerce_app/domin/entities/home_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/home/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';

@injectable
class GetHomeUseCase{
  final HomeRepo homeRepo;
  GetHomeUseCase({ required this.homeRepo});

  Future<ApiResult<HomeEntity>>call() async{
    return await homeRepo.getHome();
  }
}