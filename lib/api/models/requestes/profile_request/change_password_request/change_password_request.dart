import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest extends Equatable {
  final String? password;
  final String? newPassword;

  const ChangePasswordRequest({
    required this.password,
    required this.newPassword,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  @override
  List<Object?> get props => [password, newPassword];
}
