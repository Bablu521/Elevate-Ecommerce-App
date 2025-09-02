// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasions_reponse_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionsReponseDto _$OccasionsReponseDtoFromJson(Map<String, dynamic> json) =>
    OccasionsReponseDto(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null
              ? null
              : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      occasions:
          (json['occasions'] as List<dynamic>?)
              ?.map((e) => OccasionDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$OccasionsReponseDtoToJson(
  OccasionsReponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.metadata,
  'occasions': instance.occasions,
};
