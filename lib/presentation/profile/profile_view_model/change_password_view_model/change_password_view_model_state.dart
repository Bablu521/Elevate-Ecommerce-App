part of 'change_password_view_model_cubit.dart';

class ChangePasswordViewModelState extends Equatable {
  ChangePasswordViewModelState({
    this.changePasswordEntity,
    this.errorMessage,
    this.isLoading = false,
    this.obscureText = true,
  });
  bool isLoading;
  final String? errorMessage;
  final ChangePasswordEntity? changePasswordEntity;
  bool obscureText;
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
