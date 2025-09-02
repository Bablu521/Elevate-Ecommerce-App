// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_reponse_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsReponseDto _$ProductsReponseDtoFromJson(Map<String, dynamic> json) =>
    ProductsReponseDto(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null
              ? null
              : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ProductsReponseDtoToJson(ProductsReponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'products': instance.products,
    };
