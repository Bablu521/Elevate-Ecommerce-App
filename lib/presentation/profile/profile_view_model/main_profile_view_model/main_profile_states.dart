import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:equatable/equatable.dart';

class MainProfileStatus extends Equatable {
  final BaseState<ProfileInfoEntity>? profileInfoState;
  const MainProfileStatus({this.profileInfoState});

  MainProfileStatus copyWith({BaseState<ProfileInfoEntity>? profileInfoState}) {
    return MainProfileStatus(
      profileInfoState: profileInfoState ?? this.profileInfoState,
    );
  }

  @override
  List<Object?> get props => [profileInfoState];
}
