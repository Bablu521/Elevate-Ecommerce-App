import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_dto.dart';

part 'addresses_response_dto.g.dart';

@JsonSerializable()
class AddressesResponseDto extends Equatable {
	final String? message;
	final List<AddressDto>? address;

	const AddressesResponseDto({this.message, this.address});

	factory AddressesResponseDto.fromJson(Map<String, dynamic> json) {
		return _$AddressesResponseDtoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AddressesResponseDtoToJson(this);

	@override
	List<Object?> get props => [message, address];
}
