import 'package:elevate_ecommerce_app/domin/models/response/editprofile.dart';
import 'package:equatable/equatable.dart';

class ProfileStates extends Equatable {
  final bool profileListIsLoading;
  final String? profileListErrorMessage;
  final bool? isLogged;
  final EditProfileEntity? profileListSuccess;

  const ProfileStates({
    this.profileListIsLoading = false,
    this.profileListErrorMessage,
    this.profileListSuccess,
    this.isLogged,
  });

  ProfileStates copyWith({
    bool? profileListIsLoading,
    String? profileListErrorMessage,
    EditProfileEntity? profileListSuccess,
    bool? isLogged,
  }) {
    return ProfileStates(
      profileListIsLoading: profileListIsLoading ?? this.profileListIsLoading,
      profileListErrorMessage:
          profileListErrorMessage ?? this.profileListErrorMessage,
      profileListSuccess: profileListSuccess ?? this.profileListSuccess,
      isLogged: isLogged,
    );
  }

  @override
  List<Object?> get props => [
    profileListIsLoading,
    profileListErrorMessage,
    profileListSuccess,
    isLogged,
  ];

  @override
  bool? get stringify => true;
}
