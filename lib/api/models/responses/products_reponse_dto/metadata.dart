import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@JsonSerializable()
class Metadata extends Equatable {
	final int? currentPage;
	final int? totalPages;
	final int? limit;
	final int? totalItems;

	const Metadata({
		this.currentPage, 
		this.totalPages, 
		this.limit, 
		this.totalItems, 
	});

	factory Metadata.fromJson(Map<String, dynamic> json) {
		return _$MetadataFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MetadataToJson(this);

	@override
	List<Object?> get props => [currentPage, totalPages, limit, totalItems];
}
