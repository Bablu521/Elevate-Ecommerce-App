import 'package:elevate_ecommerce_app/api/models/responses/login_response/user_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  final String message;
  final UserResponseDto user;
  final String token;

  LoginResponseDto({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}
