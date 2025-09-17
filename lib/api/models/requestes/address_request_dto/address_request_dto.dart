import 'package:elevate_ecommerce_app/domin/entities/requests/address_request_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_request_dto.g.dart';

@JsonSerializable()
class AddressRequestDto extends Equatable {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;

  const AddressRequestDto({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
  });

  factory AddressRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddressRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressRequestDtoToJson(this);

  factory AddressRequestDto.fromDomain(
    AddressRequestEntity addressRequestEntity,
  ) {
    return AddressRequestDto(
      street:addressRequestEntity.street,
      phone:addressRequestEntity.phone,
      city:addressRequestEntity.city,
      lat:addressRequestEntity.lat,
      long:addressRequestEntity.long,
      username:addressRequestEntity.username
    );
  }

  @override
  List<Object?> get props => [street, phone, city, lat, long, username];
}
