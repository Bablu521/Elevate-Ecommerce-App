part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  final BaseState<ProfileInfoEntity>? profileInfoState;
  final BaseState<UpdateProfileEntity>? updateProfileInfoState;
  final BaseState<UploadImageEntity>? uploadImageProfileState;
  final File? localPickedImage;
  const EditProfileState({
    this.profileInfoState,
    this.updateProfileInfoState,
    this.uploadImageProfileState,
    this.localPickedImage,
  });

  EditProfileState copyWith({
    BaseState<ProfileInfoEntity>? profileInfoState,
    BaseState<UpdateProfileEntity>? updateProfileInfoState,
    BaseState<UploadImageEntity>? uploadImageProfileState,
    File? localPickedImage,
  }) {
    return EditProfileState(
      profileInfoState: profileInfoState ?? this.profileInfoState,
      updateProfileInfoState: updateProfileInfoState,
      uploadImageProfileState:
          uploadImageProfileState ?? this.uploadImageProfileState,
      localPickedImage: localPickedImage ?? this.localPickedImage,
    );
  }

  @override
  List<Object?> get props => [
    profileInfoState,
    updateProfileInfoState,
    uploadImageProfileState,
    localPickedImage,
  ];
}
