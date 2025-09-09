import 'package:elevate_ecommerce_app/domin/models/response/logOutEntity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout.g.dart';

@JsonSerializable()
class LogOutDto {
  @JsonKey(name: "message")
  final String? message;

  LogOutDto ({
    this.message,
  });

  factory LogOutDto.fromJson(Map<String, dynamic> json) {
    return _$LogOutDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LogOutDtoToJson(this);
  }
  LogOutEntity toLogOutEntity(){
    return LogOutEntity(
      message: message
    );
  }
}


