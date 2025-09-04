import 'package:elevate_ecommerce_app/domin/models/response/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class UserDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "wishlist")
  final List<dynamic>? wishlist;
  @JsonKey(name: "addresses")
  final List<dynamic>? addresses;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UserDto ({
    this.Id,
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
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }
  UserEntity toUserEntity(){
    return UserEntity(
      Id: Id,
      createdAt: createdAt,
      role: role,
      password: password,
      phone: phone,
       lastName: lastName,
      firstName: firstName,
      email: email,
      addresses: addresses,
      gender: gender,
      photo: photo,
      wishlist: wishlist
    );
  }
}