sealed class ProfileEvent {}

class OnLoadProfileEvent extends ProfileEvent {}



class EditProfilePageEvent extends ProfileEvent {
  final bool editProfilePage;

  EditProfilePageEvent({required this.editProfilePage});
}
