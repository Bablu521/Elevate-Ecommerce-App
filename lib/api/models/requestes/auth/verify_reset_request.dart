import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_request.g.dart';

@JsonSerializable()
class VerifyResetRequest {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  VerifyResetRequest ({
    this.resetCode,
  });

  factory VerifyResetRequest.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetRequestToJson(this);
  }
}


