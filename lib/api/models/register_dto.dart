import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_dto.g.dart';

@JsonSerializable()
class RegisterDto extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final List<dynamic>? wishlist;
  @JsonKey(name: '_id')
  final String? id;
  final List<dynamic>? addresses;
  final DateTime? createdAt;

  const RegisterDto({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.id,
    this.addresses,
    this.createdAt,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);

  RegisterEntity toRegisterEntity() {
    return RegisterEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      role: role,
      wishlist: wishlist,
      id: id,
      addresses: addresses,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      email,
      gender,
      phone,
      photo,
      role,
      wishlist,
      id,
      addresses,
      createdAt,
    ];
  }
}
