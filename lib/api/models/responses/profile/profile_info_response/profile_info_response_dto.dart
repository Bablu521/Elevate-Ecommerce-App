import 'package:elevate_ecommerce_app/api/models/responses/profile/profile_info_response/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_info_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileInfoResponseDto {
  final String? message;
  final UserDto? user;

  ProfileInfoResponseDto({
    this.message,
    this.user,
  });

  factory ProfileInfoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileInfoResponseDtoToJson(this);
}

