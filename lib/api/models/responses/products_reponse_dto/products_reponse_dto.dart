import 'package:elevate_ecommerce_app/api/models/product_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';

part 'products_reponse_dto.g.dart';

@JsonSerializable()
class ProductsReponseDto extends Equatable {
	final String? message;
	final Metadata? metadata;
	final List<ProductDto>? products;

	const ProductsReponseDto({this.message, this.metadata, this.products});

	factory ProductsReponseDto.fromJson(Map<String, dynamic> json) {
		return _$ProductsReponseDtoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ProductsReponseDtoToJson(this);

	@override
	List<Object?> get props => [message, metadata, products];
}
