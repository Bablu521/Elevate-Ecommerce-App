import 'package:elevate_ecommerce_app/domin/models/response/editprofile.dart';
import 'package:equatable/equatable.dart';

import '../../../domin/models/response/logOutEntity.dart';

class ProfileStates extends Equatable {
  final bool profileListIsLoading;
  final String? profileListErrorMessage;
  final bool? isLogged;
  final EditProfileEntity? profileListSuccess;

  final bool logOutListIsLoading;
  final String? logOuListErrorMessage;
  final LogOutEntity? logOuListSuccess;



  const ProfileStates({
    this.profileListIsLoading = false,
    this.profileListErrorMessage,
    this.profileListSuccess,
    this.isLogged,

    this.logOutListIsLoading = false,
    this.logOuListErrorMessage,
    this.logOuListSuccess,

  });

  ProfileStates copyWith({
    bool? profileListIsLoading,
    String? profileListErrorMessage,
    EditProfileEntity? profileListSuccess,
    bool? isLogged,

    bool? logOutListIsLoading,
    String? logOuListErrorMessage,
    LogOutEntity? logOuListSuccess,


  }) {
    return ProfileStates(
      profileListIsLoading: profileListIsLoading ?? this.profileListIsLoading,
      profileListErrorMessage:
          profileListErrorMessage ?? this.profileListErrorMessage,
      profileListSuccess: profileListSuccess ?? this.profileListSuccess,
      isLogged: isLogged,

      logOutListIsLoading: logOutListIsLoading ?? this.logOutListIsLoading,
      logOuListErrorMessage: logOuListErrorMessage ?? this.logOuListErrorMessage,
      logOuListSuccess: logOuListSuccess ?? this.logOuListSuccess,


    );
  }

  @override
  List<Object?> get props => [
    profileListIsLoading,
    profileListErrorMessage,
    profileListSuccess,
    isLogged,
    logOutListIsLoading,
    logOuListErrorMessage,
    logOuListSuccess

  ];

  @override
  bool? get stringify => true;
}
