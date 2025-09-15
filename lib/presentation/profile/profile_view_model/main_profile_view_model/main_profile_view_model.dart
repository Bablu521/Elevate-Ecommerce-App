import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_profile_info_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/main_profile_view_model/main_profile_event.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/main_profile_view_model/main_profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainProfileViewModel extends Cubit<MainProfileStatus> {
  final GetProfileInfoUseCase _getProfileInfoUseCase;
  MainProfileViewModel(this._getProfileInfoUseCase)
    : super(const MainProfileStatus());

  void doIntent(MainProfileEvent event) {
    switch (event) {
      case OnLoadLogOutEvent():
        _logOut();
      case GetProfileInfoEvent():
        _getProfileInfo();
    }
  }

  Future<void> _getProfileInfo() async {
    emit(state.copyWith(profileInfoState: BaseState.loading()));
    final response = await _getProfileInfoUseCase.call();
    switch (response) {
      case ApiSuccessResult<ProfileInfoEntity>():
        emit(
          state.copyWith(profileInfoState: BaseState.success(response.data)),
        );
      case ApiErrorResult<ProfileInfoEntity>():
        emit(
          state.copyWith(
            profileInfoState: BaseState.error(response.errorMessage),
          ),
        );
    }
  }

  Future<void> _logOut() async {}
}
