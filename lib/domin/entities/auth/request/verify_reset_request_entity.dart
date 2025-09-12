import 'package:equatable/equatable.dart';

class VerifyResetRequestEntity extends Equatable {
  final String? resetCode;

  const VerifyResetRequestEntity({this.resetCode});

  @override
  List<Object?> get props => [resetCode];
}
