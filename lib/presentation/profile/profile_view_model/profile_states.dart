import 'package:elevate_ecommerce_app/domin/models/response/editprofile.dart';
import 'package:equatable/equatable.dart';

class ProfileStates extends Equatable {
  final bool profileListIsLoading;
  final String? profileListErrorMessage;
  final bool editProfile;
  final bool? isLogged;
  final EditProfileEntity? profileListSuccess;

  const ProfileStates({
    this.profileListIsLoading = false,
    this.profileListErrorMessage,
    this.profileListSuccess,
    this.editProfile = false,
    this.isLogged,
  });

  ProfileStates copyWith({
    bool? profileListIsLoading,
    String? profileListErrorMessage,
    EditProfileEntity? profileListSuccess,
    bool? editProfile,
    bool? isLogged,
  }) {
    return ProfileStates(
      profileListIsLoading: profileListIsLoading ?? this.profileListIsLoading,
      profileListErrorMessage:
          profileListErrorMessage ?? this.profileListErrorMessage,
      profileListSuccess: profileListSuccess ?? this.profileListSuccess,
      editProfile: editProfile ?? this.editProfile,
      isLogged: isLogged,
    );
  }

  @override
  List<Object?> get props => [
    profileListIsLoading,
    profileListErrorMessage,
    profileListSuccess,
    editProfile,
    isLogged,
  ];

  @override
  bool? get stringify => true;
}
