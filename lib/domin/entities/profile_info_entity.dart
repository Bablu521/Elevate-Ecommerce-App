import 'package:equatable/equatable.dart';

class ProfileInfoEntity extends Equatable {
  final String message;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String phone;
  final String imagePath;

  const ProfileInfoEntity({
    required this.message,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.phone,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [
    message,
    email,
    firstName,
    lastName,
    gender,
    phone,
    imagePath,
  ];
}
