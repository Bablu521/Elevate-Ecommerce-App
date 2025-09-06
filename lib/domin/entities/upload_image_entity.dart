import 'package:equatable/equatable.dart';

class UploadImageEntity extends Equatable {
  final String message;

  const UploadImageEntity({required this.message});
  @override
  List<Object?> get props => [message];
}
