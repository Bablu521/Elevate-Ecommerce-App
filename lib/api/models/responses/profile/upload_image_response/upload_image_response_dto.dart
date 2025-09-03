import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_image_response_dto.g.dart';

@JsonSerializable()
class UploadImageResponseDto extends Equatable {
  final String message;

  const UploadImageResponseDto({required this.message});

  factory UploadImageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResponseDtoToJson(this);

  @override
  List<Object?> get props => [message];
}
