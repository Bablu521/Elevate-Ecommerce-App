import 'package:equatable/equatable.dart';

class VerifyResetRequestEntity extends Equatable {
  final String? resetCode;

  VerifyResetRequestEntity({this.resetCode});

  @override
  List<Object?> get props => [resetCode];
}
