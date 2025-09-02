import 'package:elevate_ecommerce_app/domin/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GuestLoginUseCase {
  final AuthRepo _authRepo;

  GuestLoginUseCase(this._authRepo);
  Future<void> call() async {
    return await _authRepo.guestUserLogin();
  }
}
