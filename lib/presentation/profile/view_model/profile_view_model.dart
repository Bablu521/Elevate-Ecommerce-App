import 'package:elevate_ecommerce_app/domin/models/response/edit_profile.dart';
import 'package:elevate_ecommerce_app/domin/use_case/edit_profile_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/profile/view_model/profile_event.dart';
import 'package:elevate_ecommerce_app/presentation/profile/view_model/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api_result/api_result.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  final EditProfileUseCase _editProfileUseCase;
  ProfileViewModel(this._editProfileUseCase, )
      : super(const ProfileStates());

  void doIntent(ProfileEvent event) {
    switch (event) {
      case OnLoadProfileEvent():
        _editProfile();

    }
  }

  late List<EditProfileEntity> profileListSuccess = [];

  Future<void> _editProfile() async {
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