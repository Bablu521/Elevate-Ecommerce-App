import 'package:elevate_ecommerce_app/api/models/responses/profile/update_profile_info_response/update_profile_user_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_info_response_dto.g.dart';

@JsonSerializable()
class UpdateProfileInfoResponseDto extends Equatable {
  final String? message;
  @JsonKey(name: "user")
  final UserDtoUpdateProfile? user;

  const UpdateProfileInfoResponseDto({this.message, this.user});

  factory UpdateProfileInfoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileInfoResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileInfoResponseDtoToJson(this);

  @override
  List<Object?> get props => [message, user];
}
