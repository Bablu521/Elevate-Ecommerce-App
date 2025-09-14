import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserStatusUseCase {
  final AuthRepo _authRepo;

  GetUserStatusUseCase(this._authRepo);
  Future<bool> call() async {
    return await _authRepo.getUserStatus();
  }
}
