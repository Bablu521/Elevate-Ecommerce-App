import 'package:bloc/bloc.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/change_password_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/change_password_profile_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/profile/view_model/change_password_view_model/change_password_view_model_event.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'change_password_view_model_state.dart';

@injectable
class ChangePasswordViewModelCubit extends Cubit<ChangePasswordViewModelState> {
  ChangePasswordViewModelCubit(this._changePasswordProfileUseCase)
    : super(ChangePasswordViewModelState());
  final ChangePasswordProfileUseCase _changePasswordProfileUseCase;
  Future<void> doIntent(ChangePasswordViewModelEvent event) async {
    switch (event) {
      case ChangePasswordEvent():
        await _changePassword(request: event.changePasswordRequest);
    }
  }

  Future<void> _changePassword({required ChangePasswordRequest request}) async {
    emit(state.copyWith(isLoading: true));
    final response = await _changePasswordProfileUseCase.call(request);
    switch (response) {
      case ApiSuccessResult<ChangePasswordEntity>():
        emit(state.copyWith(changePasswordEntity: response.data));
      case ApiErrorResult<ChangePasswordEntity>():
        emit(state.copyWith(errorMessage: response.errorMessage));
    }
  }
}
