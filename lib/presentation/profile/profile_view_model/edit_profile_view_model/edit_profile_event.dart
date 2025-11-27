import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:image_picker/image_picker.dart';

sealed class EditProfileEvent {}

class EditProfileGetInfoUser extends EditProfileEvent {}

class EditProfileUpdateProfileInfoEvent extends EditProfileEvent {
  final UpdateProfileInfoRequest request;

  EditProfileUpdateProfileInfoEvent({required this.request});
}

class EditProfileUploadImageEvent extends EditProfileEvent {
  final ImageSource imageSource;

  EditProfileUploadImageEvent({required this.imageSource});
}
