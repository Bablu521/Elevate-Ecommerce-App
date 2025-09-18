part of 'change_password_view_model_cubit.dart';

// ignore: must_be_immutable
class ChangePasswordViewModelState extends Equatable {
  const ChangePasswordViewModelState({
    this.changePasswordEntity,
    this.errorMessage,
    this.isLoading = false,
    this.obscureText = true,
  });
  final bool isLoading;
  final String? errorMessage;
  final ChangePasswordEntity? changePasswordEntity;
  final bool obscureText;
  ChangePasswordViewModelState copyWith({
    bool? isLoading,
    String? errorMessage,
    ChangePasswordEntity? changePasswordEntity,
    bool? obscureText,
  }) {
    return ChangePasswordViewModelState(
      changePasswordEntity: changePasswordEntity ?? this.changePasswordEntity,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? false,
      obscureText: obscureText ?? this.obscureText,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    changePasswordEntity,
    obscureText,
  ];
}
