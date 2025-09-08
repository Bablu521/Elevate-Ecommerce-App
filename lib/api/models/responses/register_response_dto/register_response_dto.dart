import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../register_dto.dart';

part 'register_response_dto.g.dart';

@JsonSerializable()
class RegisterResponseDto extends Equatable {
  final String? message;
  final RegisterDto? user;
  final String? token;

  const RegisterResponseDto({this.message, this.user, this.token});

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterResponseDtoToJson(this);

  @override
  List<Object?> get props => [message, user, token];
}
