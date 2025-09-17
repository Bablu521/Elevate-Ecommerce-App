import 'package:equatable/equatable.dart';

class ChangePasswordEntity extends Equatable {
  final String token;
  final String message;

  const ChangePasswordEntity({required this.token, required this.message});

  @override
  List<Object?> get props => [token, message];
}
