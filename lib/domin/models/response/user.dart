import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserEntity extends Equatable {
  @JsonKey(name: "Id")
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

  const UserEntity({
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
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    password,
    gender,
    phone,
    photo,
    role,
    wishlist,
    addresses,
    createdAt,
  ];

  @override
  bool? get stringify => true;
}
