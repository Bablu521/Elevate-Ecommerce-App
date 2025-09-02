import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogoutUseCase {
  final AuthRepo _authRepo;
  LogoutUseCase(this._authRepo);
  Future<void> call() async {
    return await _authRepo.userLogout();
  }
}
