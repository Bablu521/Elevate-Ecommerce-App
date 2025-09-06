import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/update_profile_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/upload_image_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_profile_info_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/update_profile_info_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/upload_profile_image_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/edit_profile_view_model/edit_profile_event.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(
    this._getProfileInfoUseCase,
    this._updateProfileInfoUseCase,
    this._uploadProfileImageUseCase,
  ) : super(EditProfileState());
  final GetProfileInfoUseCase _getProfileInfoUseCase;
  final UpdateProfileInfoUseCase _updateProfileInfoUseCase;
  final UploadProfileImageUseCase _uploadProfileImageUseCase;
  final ImagePicker _picker = ImagePicker();

  Future<void> doIntent(EditProfileEvent event) async {
    switch (event) {
      case EditProfileGetInfoUser():
        await _getProfileInfo();
      case EditProfileUpdateProfileInfoEvent():
        await _updateProfileInfo(event.request);
      case EditProfileUploadImageEvent():
        await _pickAndUploadImage(ImageSource.gallery);
    }
  }

  Future<void> _getProfileInfo() async {
    emit(state.copyWith(profileInfoState: BaseState.loading()));
    final response = await _getProfileInfoUseCase.call();
    switch (response) {
      case ApiSuccessResult<ProfileInfoEntity>():
        emit(
          state.copyWith(profileInfoState: BaseState.success(response.data)),
        );
      case ApiErrorResult<ProfileInfoEntity>():
        emit(
          state.copyWith(
            profileInfoState: BaseState.error(response.errorMessage),
          ),
        );
    }
  }

  Future<void> _pickAndUploadImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile == null) return;
      final file = File(pickedFile.path);
      emit(
        state.copyWith(
          localPickedImage: file,
          uploadImageProfileState: BaseState.loading(),
        ),
      );
      final multipart = await MultipartFile.fromFile(file.path);
      final response = await _uploadProfileImageUseCase.call(multipart);
      switch (response) {
        case ApiSuccessResult<UploadImageEntity>():
          emit(
            state.copyWith(
              uploadImageProfileState: BaseState.success(response.data),
            ),
          );
        case ApiErrorResult<UploadImageEntity>():
          emit(
            state.copyWith(
              uploadImageProfileState: BaseState.error(response.errorMessage),
            ),
          );
      }
    } catch (e) {
      emit(
        state.copyWith(uploadImageProfileState: BaseState.error(e.toString())),
      );
    }
  }

  Future<void> _updateProfileInfo(UpdateProfileInfoRequest request) async {
    emit(state.copyWith(updateProfileInfoState: BaseState.loading()));
    final response = await _updateProfileInfoUseCase.call(request);
    switch (response) {
      case ApiSuccessResult<UpdateProfileEntity>():
        emit(
          state.copyWith(
            updateProfileInfoState: BaseState.success(response.data),
          ),
        );
      case ApiErrorResult<UpdateProfileEntity>():
        emit(
          state.copyWith(
            updateProfileInfoState: BaseState.error(response.errorMessage),
          ),
        );
    }
  }
}
