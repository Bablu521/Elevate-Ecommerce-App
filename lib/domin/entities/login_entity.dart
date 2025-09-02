import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String? userToken;
  final String? message;
  const LoginEntity({required this.userToken, required this.message});

  @override
  List<Object?> get props => [userToken, message];
}
