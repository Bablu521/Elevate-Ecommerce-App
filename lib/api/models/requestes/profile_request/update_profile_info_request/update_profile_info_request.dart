import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'update_profile_info_request.g.dart';

@JsonSerializable()
class UpdateProfileInfoRequest extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  const UpdateProfileInfoRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory UpdateProfileInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileInfoRequestToJson(this);

  @override
  List<Object?> get props => [firstName, lastName, email, phone];
}
