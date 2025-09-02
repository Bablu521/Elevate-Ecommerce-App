import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequestModel extends Equatable {
  final String email;
  final String password;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool rememberMe;
  LoginRequestModel({
    required this.email,
    required this.password,
    this.rememberMe = false,
  });

  // fromJson
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  @override
  List<Object?> get props => [email, password, rememberMe];
}
