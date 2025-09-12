import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_dto.dart';

part 'address_response_dto.g.dart';

@JsonSerializable()
class AddressResponseDto extends Equatable {
  final String? message;
  final List<AddressDto>? address;

  const AddressResponseDto({this.message, this.address});

  factory AddressResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddressResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressResponseDtoToJson(this);

  @override
  List<Object?> get props => [message, address];
}