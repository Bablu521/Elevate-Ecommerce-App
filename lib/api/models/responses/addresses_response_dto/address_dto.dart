import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDto extends Equatable {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;
  @JsonKey(name: '_id')
  final String? id;

  const AddressDto({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return _$AddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressDtoToJson(this);

  AddressEntity toAddressEntity() {
    return AddressEntity(
      street: street,
      phone: phone,
      city: city,
      lat: lat,
      long: long,
      username: username,
      id: id,
    );
  }

  @override
  List<Object?> get props {
    return [street, phone, city, lat, long, username, id];
  }
}