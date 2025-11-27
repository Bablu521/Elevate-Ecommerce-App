import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/logout_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:equatable/equatable.dart';

class MainProfileStatus extends Equatable {
  final BaseState<ProfileInfoEntity>? profileInfoState;
  final BaseState<LogoutEntity>? profileLogoutState;
  final bool? isLogged;
  const MainProfileStatus({
    this.profileInfoState,
    this.isLogged,
    this.profileLogoutState,
  });

  MainProfileStatus copyWith({
    BaseState<ProfileInfoEntity>? profileInfoState,
    bool? isLogged,
    BaseState<LogoutEntity>? profileLogoutState,
  }) {
    return MainProfileStatus(
      profileInfoState: profileInfoState ?? this.profileInfoState,
      isLogged: isLogged ?? this.isLogged,
      profileLogoutState: profileLogoutState ?? this.profileLogoutState,
    );
  }

  @override
  List<Object?> get props => [profileInfoState, isLogged , profileLogoutState];
}
