import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'occasion_dto.g.dart';

@JsonSerializable()
class OccasionDto extends Equatable {
	@JsonKey(name: '_id') 
	final String? id;
	final String? name;
	final String? slug;
	final String? image;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final bool? isSuperAdmin;
	final int? productsCount;

	const OccasionDto({
		this.id, 
		this.name, 
		this.slug, 
		this.image, 
		this.createdAt, 
		this.updatedAt, 
		this.isSuperAdmin, 
		this.productsCount, 
	});

	factory OccasionDto.fromJson(Map<String, dynamic> json) {
		return _$OccasionDtoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OccasionDtoToJson(this);

	@override
	List<Object?> get props {
		return [
				id,
				name,
				slug,
				image,
				createdAt,
				updatedAt,
				isSuperAdmin,
				productsCount,
		];
	}
}
