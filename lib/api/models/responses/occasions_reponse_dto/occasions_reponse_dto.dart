import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';
import '../../occasion_dto.dart';

part 'occasions_reponse_dto.g.dart';

@JsonSerializable()
class OccasionsReponseDto extends Equatable {
	final String? message;
	final Metadata? metadata;
	final List<OccasionDto>? occasions;

	const OccasionsReponseDto({this.message, this.metadata, this.occasions});

	factory OccasionsReponseDto.fromJson(Map<String, dynamic> json) {
		return _$OccasionsReponseDtoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OccasionsReponseDtoToJson(this);

	@override
	List<Object?> get props => [message, metadata, occasions];
}
