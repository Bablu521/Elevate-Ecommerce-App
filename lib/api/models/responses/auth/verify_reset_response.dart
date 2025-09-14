import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_response.g.dart';

@JsonSerializable()
class VerifyResetResponse {
  @JsonKey(name: "status")
  final String? status;

  VerifyResetResponse ({
    this.status,
  });

  factory VerifyResetResponse.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetResponseToJson(this);
  }
}


