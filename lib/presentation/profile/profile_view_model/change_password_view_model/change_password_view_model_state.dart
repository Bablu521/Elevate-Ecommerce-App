part of 'change_password_view_model_cubit.dart';

class ChangePasswordViewModelState extends Equatable {
  ChangePasswordViewModelState({
    this.changePasswordEntity,
    this.errorMessage,
    this.isLoading = false,
  });
  bool isLoading;
  final String? errorMessage;
  final ChangePasswordEntity? changePasswordEntity;
  ChangePasswordViewModelState copyWith({
    bool? isLoading,
    String? errorMessage,
    ChangePasswordEntity? changePasswordEntity,
  }) {
    return ChangePasswordViewModelState(
      changePasswordEntity: changePasswordEntity ?? this.changePasswordEntity,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? false,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, changePasswordEntity];
}
