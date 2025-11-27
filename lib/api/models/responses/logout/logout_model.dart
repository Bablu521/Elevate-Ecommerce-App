import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_model.g.dart';

@JsonSerializable()
class LogoutModel extends Equatable {
  final String message;

  const LogoutModel({required this.message});

  /// From JSON
  factory LogoutModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutModelFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$LogoutModelToJson(this);

  @override
  List<Object?> get props => [message];
}
