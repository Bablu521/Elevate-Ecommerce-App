import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';

sealed class ChangePasswordViewModelEvent {}

class ObscureTextEven extends ChangePasswordViewModelEvent {}

class ChangePasswordEvent extends ChangePasswordViewModelEvent {
  final ChangePasswordRequest changePasswordRequest;

  ChangePasswordEvent({required this.changePasswordRequest});
}
