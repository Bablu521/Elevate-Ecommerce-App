
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String? Id;
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

  const UserEntity ({
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

  @override
  // TODO: implement props
  List<Object?> get props => [
    Id,
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
