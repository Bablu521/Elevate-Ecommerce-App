import 'package:elevate_ecommerce_app/api/models/responses/auth/profile/user.dart';
import 'package:elevate_ecommerce_app/domin/models/response/edit_profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile.g.dart';

@JsonSerializable()
class EditProfileDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;

  EditProfileDto ({
    this.message,
    this.user,
  });

  factory EditProfileDto.fromJson(Map<String, dynamic> json) {
    return _$EditProfileDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProfileDtoToJson(this);
  }
  EditProfileEntity toEditProfileEntity(){
    return EditProfileEntity(
      message: message,
      user: user?.toUserEntity()
    );
  }
}




