import 'package:elevate_ecommerce_app/domin/models/response/edit_profile.dart';
import 'package:elevate_ecommerce_app/domin/use_case/edit_profile_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_case/logout_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_user_status_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/profile_event.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api_result/api_result.dart';
import '../../../domin/models/response/logout_entity.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  final EditProfileUseCase _editProfileUseCase;
  final GetUserStatusUseCase _getUserStatusUseCase;
  final LogOutUseCase _logoutUseCase;
  ProfileViewModel(this._editProfileUseCase, this._getUserStatusUseCase,this._logoutUseCase)
    : super(const ProfileStates());

  void doIntent(ProfileEvent event) {
    switch (event) {
      case OnLoadProfileEvent():
        _editProfile();
      case OnLoadLogOutEvent():
        _logOut();
    }
  }

  Future<void> _editProfile() async {
    emit(state.copyWith(profileListIsLoading: true));
    final bool isLogged = await _getUserStatusUseCase();
    if (!isLogged) {
      emit(state.copyWith(isLogged: isLogged));
    } else {
      emit(state.copyWith(profileListIsLoading: true));
      final result = await _editProfileUseCase.call();
      switch (result) {
        case ApiSuccessResult<EditProfileEntity>():
          emit(
            state.copyWith(
              profileListIsLoading: false,
              profileListSuccess: result.data,
            ),
          );

        case ApiErrorResult<EditProfileEntity>():
          emit(
            state.copyWith(
              profileListIsLoading: false,
              profileListErrorMessage: result.errorMessage,
            ),
          );
      }
    }
  }
  late List<LogOutEntity> logOutListSuccess = [];



  Future<void> _logOut() async {
    emit(state.copyWith(logOutListIsLoading: true));
    final result = await _logoutUseCase.call();
    switch (result) {
      case ApiSuccessResult<LogOutEntity>():
        emit(
          state.copyWith(
            logOutListIsLoading: false,
            logOuListSuccess: result.data,

          ),

        );

      case ApiErrorResult<LogOutEntity>():
        emit(
          state.copyWith(
            logOutListIsLoading: false,
            logOuListErrorMessage: result.errorMessage,
          ),
        );
    }
  }

}
