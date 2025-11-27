import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:equatable/equatable.dart';

class RegisterStates extends Equatable {
  final bool isLoading;
  final RegisterEntity? data;
  final String? errorMessage;

  const RegisterStates({this.isLoading = false, this.data, this.errorMessage});

  @override
  List<Object?> get props => [isLoading, data, errorMessage];

  RegisterStates copyWith({
    bool? isLoading,
    RegisterEntity? data,
    String? errorMessage,
  }) {
    return RegisterStates(
      isLoading: isLoading ?? this.isLoading,
      data: data,
      errorMessage: errorMessage,
    );
  }
}
