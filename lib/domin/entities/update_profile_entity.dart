import 'package:equatable/equatable.dart';

class UpdateProfileEntity extends Equatable {
  final String firstName;
  final String message;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String photo;

  const UpdateProfileEntity({
    required this.message,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
  });
  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    message,
    phone,
    gender,
    photo,
    phone,
  ];
}
