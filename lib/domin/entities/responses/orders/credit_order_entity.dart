import 'package:equatable/equatable.dart';

class CreditOrderEntity extends Equatable {
  final String? message;
  final String? url;

  const CreditOrderEntity({this.message, this.url});

  @override
  List<Object?> get props => [message, url];
}
