import 'package:json_annotation/json_annotation.dart';
part 'update_profile_user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDtoUpdateProfile {
  @JsonKey(name: "_id")
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final List<dynamic>? wishlist;
  final List<dynamic>? addresses;
  final String? createdAt;
  final String? passwordChangedAt;

  UserDtoUpdateProfile({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
    this.passwordChangedAt,
  });

  factory UserDtoUpdateProfile.fromJson(Map<String, dynamic> json) =>
      _$UserDtoUpdateProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoUpdateProfileToJson(this);
}
