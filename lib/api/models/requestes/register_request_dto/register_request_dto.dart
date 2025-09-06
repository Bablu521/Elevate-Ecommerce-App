import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_dto.g.dart';

@JsonSerializable()
class RegisterRequestDto extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;
  final String? gender;

  const RegisterRequestDto({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
    this.gender,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);

  factory RegisterRequestDto.fromDomain(
    RegisterRequestEntity registerRequestEntity,
  ) {
    return RegisterRequestDto(
      firstName: registerRequestEntity.firstName,
      lastName: registerRequestEntity.lastName,
      email: registerRequestEntity.email,
      password: registerRequestEntity.password,
      rePassword: registerRequestEntity.rePassword,
      phone: registerRequestEntity.phone,
      gender: registerRequestEntity.gender,
    );
  }

  @override
  List<Object?> get props {
    return [firstName, lastName, email, password, rePassword, phone, gender];
  }
}
