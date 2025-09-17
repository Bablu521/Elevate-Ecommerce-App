import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_dto.dart';

part 'addresses_response_dto.g.dart';

@JsonSerializable()
class AddressesResponseDto extends Equatable {
	final String? message;
	final List<AddressDto>? addresses;

	const AddressesResponseDto({this.message, this.addresses});

	factory AddressesResponseDto.fromJson(Map<String, dynamic> json) {
		return _$AddressesResponseDtoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AddressesResponseDtoToJson(this);

	@override
	List<Object?> get props => [message, addresses];
}
