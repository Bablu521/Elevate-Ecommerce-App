import 'package:equatable/equatable.dart';

class ResetPasswordRequestEntity extends Equatable {
  final String? email;
  final String? newPassword;

  ResetPasswordRequestEntity({this.email, this.newPassword});

  @override
  List<Object?> get props => [email, newPassword];
}
